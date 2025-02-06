package main

import (
	"fmt"
	"os/exec"
	"math/rand"
	"strconv"
	"strings"
	"time"
)

func count(n int, runs int) {
	var results []int

	// シードを設定
	rand.Seed(time.Now().UnixNano())

	// 指定された回数だけ実行
	for i := 0; i < runs; i++ {
		// ランダムな順序で1からnまでの整数を生成
		seq := make([]int, n)
		for j := 1; j <= n; j++ {
			seq[j-1] = j
		}
		rand.Shuffle(n, func(i, j int) {
			seq[i], seq[j] = seq[j], seq[i]
		})

		// shuffleした順序を文字列に変換
		seqStr := make([]string, n)
		for j, num := range seq {
			seqStr[j] = strconv.Itoa(num)
		}

		// push_swapコマンドを実行し、結果をwc -lでカウント
		cmd := exec.Command("../push_swap", seqStr...)
		output, err := cmd.Output()
		if err != nil {
			fmt.Println("Error running push_swap:", err)
			return
		}

		// 出力を行数として解釈
		lines := strings.TrimSpace(string(output))
		lineCount, err := strconv.Atoi(lines)
		if err != nil {
			fmt.Println("Error parsing output:", err)
			return
		}

		results = append(results, lineCount)
	}

	// 最大値、最小値、平均値を計算
	max := results[0]
	min := results[0]
	sum := 0
	for _, result := range results {
		if result > max {
			max = result
		}
		if result < min {
			min = result
		}
		sum += result
	}
	avg := sum / len(results)

	// 結果を表示
	fmt.Printf("MAX: %d\n", max)
	fmt.Printf("MIN: %d\n", min)
	fmt.Printf("AVE: %d\n", avg)
}

func main() {
	// テスト1: 5, 実行回数100回
	fmt.Println("TEST 5")
	fmt.Println("--------")
	count(5, 100)
	fmt.Println()

	// テスト2: 100, 実行回数100回
	fmt.Println("TEST 100")
	fmt.Println("--------")
	count(100, 100)
	fmt.Println()

	// テスト3: 500, 実行回数30回
	fmt.Println("TEST 500")
	fmt.Println("--------")
	count(500, 30)
	fmt.Println()
}
