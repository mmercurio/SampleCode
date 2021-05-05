# Two Sums in Ruby with some RSpec test cases
#
#  Given an array of integers, return indices of the two numbers such that
#  they add up to a specific target. It is important to note that you CANNOT
#  use the same element in the array twice, but you can assume that there will
#  only be ONE solution for each test case.
#
#  Examples:
#    Input: nums = [1,4,10,-3], target = 14
#    Output: [1,2] or [2,1] # 4 + 10 = 14
#
#    Input: nums = [9,5,1,23], target = 10
#    Output: [0,2] or [2,0] # 9 + 1 = 10
#
#    Input: nums = [1,-2,5,10], target = -1
#    Output: [0,1] or [1,0] # 1 + -2 = -1

# The naive, brute force, solution
# Just compare each integer until a solution is found.
def naive_two_sums(nums, target)
    for i in 0..nums.size-1
        for j in i+1..nums.size-1
            if nums[i] + nums[j] == target
                return [i, j]
            end
        end
    end
end

# Optimized version
def two_sums(nums, target)
    nums_map = {} # maps num to its index in nums array
    for i in 0..nums.size-1
        nums_map[nums[i]] = i
    end
    nums_map.each do |num,index1|
        index2 = nums_map[target - num]
        if index2 != nil
            return [ index1, index2 ]
        end
    end
end

RSpec.describe 'find two sums' do
    it 'ex1: [1,4,10,-3] with target 14 returns result [1,2]' do
        nums = [1,4,10,-3]
        target = 14
        result = two_sums(nums, target)
        expect(result.size).to be == 2
        expect(result).to include(1,2) # order doesn't matter
    end
    it 'ex2: [9,5,1,23] with target 14 returns result [0,2]' do
        nums = [9,5,1,23]
        target = 10
        result = two_sums(nums, target)
        expect(result.size).to be == 2
        expect(result).to include(0,2) # order doesn't matter
    end
    it 'ex3: [1,-2,5,10] with target -1 returns result [0,1]' do
        nums = [1,-2,5,10]
        target = -1
        result = two_sums(nums, target)
        expect(result.size).to be == 2
        expect(result).to include(0,1) # order doesn't matter
    end
end
