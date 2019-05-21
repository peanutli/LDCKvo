

/*
 输入: "the sky is blue"
 输出: "blue is sky the"
 
 输入: "  hello world!  "
 输出: "world! hello"
 
 输入: "a good   example"
 输出: "example good a"
 
 **/
class Solution {
    func reverseWords(_ s: String) -> String {
        let array = cuttingWords(s)
        var str = ""
        if array.count > 0 {
            for  i in stride(from: array.count-1, to: 0, by: -1) {
                str = str + array[i] + " "
            }
            str = str + array[0]
        }
        return str
    }
    
    func cuttingWords(_ s: String) -> Array<String.SubSequence>{
       let array = s.split(separator:" ")
       return array
    }
}

let solution = Solution()
let s = solution.reverseWords(" ")
print(s)
