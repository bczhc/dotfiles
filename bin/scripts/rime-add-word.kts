#!/usr/bin/env kscript

package pers.zhc

import java.io.File

fun main(args: Array<String>) {
    data class DictEntry(
        val word: String,
        val freq: Int,
        val code: String,
    )

    if (args.isEmpty()) {
        println("Usage: Command q|query <entry>")
        println("       Command a|add <entry> <frequency> <code>")
        return
    }

    when (val command = args[0]) {
        "q", "query" -> {
            val code = args[1]
            val dictEntries = File("/home/bczhc/.local/share/fcitx5/rime/tiger_zi.dict.yaml")
                .readLines()
                .drop(18).mapNotNull {
                    val split = it.split("\t")
                    if (it.isNotEmpty()) {
                        DictEntry(split[0], split[1].toInt(), split[2])
                    } else null
                }
            val dictEntries2 = File("/home/bczhc/.local/share/fcitx5/rime/tiger_ci.dict.yaml")
                .readLines()
                .drop(19).mapNotNull {
                    val split = it.split("\t")
                    if (it.isNotEmpty()) {
                        DictEntry(split[0], split[1].toInt(), split[2])
                    } else null
                }
            val dictEntries3 = File("/home/bczhc/.local/share/fcitx5/rime/tiger_simp_ci.dict.yaml")
                .readLines()
                .drop(19).mapNotNull {
                    val split = it.split("\t")
                    if (it.isNotEmpty()) {
                        DictEntry(split[0], split[1].toInt(), split[2])
                    } else null
                }
            val entries = buildList {
                addAll(dictEntries)
                addAll(dictEntries2)
                addAll(dictEntries3)
            }
            entries.groupBy { it.code }
                .mapValues {
                    it.value.sortedByDescending { x -> x.freq }
                }
                .entries
                .toList()
                .find {
                    it.key == code
                }?.let {
                    it.value.forEach { x ->
                        println("${x.code} ${x.freq} ${x.word}")
                    }
                }
        }

        "a", "add" -> {
            val customDictFile = File("/home/bczhc/.local/share/fcitx5/rime/tiger_ci.custom.dict.yaml")
            val word = args[1]
            val freq = args[2]
            val code = args[3]
            val lines = customDictFile
                .readLines().toMutableList()
            val index = lines.indexOfFirst { it.contains("----自定义词----") }
            if (index == -1) throw AssertionError("index == -1")
            lines.add(index + 1, "$word\t$freq\t$code")
            with(customDictFile.writer()) {
                lines.forEach {
                    this.write(it)
                    this.write("\n")
                }
                this.flush()
                this.close()
            }
        }

        else -> {
            println("Unknown command: $command")
        }
    }
}

main(args)
