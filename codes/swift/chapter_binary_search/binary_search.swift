/**
 * File: binary_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 二分查找（双闭区间） */
func binarySearch(nums: [Int], target: Int) -> Int {
    // 初始化双闭区间 [0, n-1] ，即 i, j 分别指向数组首元素、尾元素
    var i = 0
    var j = nums.count - 1
    // 循环，当搜索区间为空时跳出（当 i > j 时为空）
    while i <= j {
        let m = i + (j - i) / 2 // 计算中点索引 m
        if nums[m] < target { // 此情况说明 target 在区间 [m+1, j] 中
            i = m + 1
        } else if nums[m] > target { // 此情况说明 target 在区间 [i, m-1] 中
            j = m - 1
        } else { // 找到目标元素，返回其索引
            return m
        }
    }
    // 未找到目标元素，返回 -1
    return -1
}

/* 二分查找（左闭右开） */
func binarySearchLCRO(nums: [Int], target: Int) -> Int {
    // 初始化左闭右开 [0, n) ，即 i, j 分别指向数组首元素、尾元素+1
    var i = 0
    var j = nums.count
    // 循环，当搜索区间为空时跳出（当 i = j 时为空）
    while i < j {
        let m = i + (j - i) / 2 // 计算中点索引 m
        if nums[m] < target { // 此情况说明 target 在区间 [m+1, j) 中
            i = m + 1
        } else if nums[m] > target { // 此情况说明 target 在区间 [i, m) 中
            j = m
        } else { // 找到目标元素，返回其索引
            return m
        }
    }
    // 未找到目标元素，返回 -1
    return -1
}

@main
enum BinarySearch {
    /* Driver Code */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 67, 70, 92]

        /* 二分查找（双闭区间） */
        var index = binarySearch(nums: nums, target: target)
        print("目标元素 6 的索引 = \(index)")

        /* 二分查找（左闭右开） */
        index = binarySearchLCRO(nums: nums, target: target)
        print("目标元素 6 的索引 = \(index)")
    }
}
