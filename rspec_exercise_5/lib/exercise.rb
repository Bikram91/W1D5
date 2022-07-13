# def zip(*arr)
#   new_arr = Array.new(arr[0].length){Array.new(arr.length)}
#   print new_arr
#   arr[0].each_index do |col|
#     arr.each_index do |row|
#       new_arr[col][row] = arr[row][col]
#     end
#   end
#   new_arr
# end

def zip(*arr)
  new_arr = arr.transpose
end

def prizz_proc(arr, prc1, prc2)
  new_arr = arr.select do |ele|
    (prc1.call(ele) || prc2.call(ele)) && (!(prc1.call(ele)) || !(prc2.call(ele)))
  end
end

def zany_zip(*arr)
    length = max(arr)
    new_arr = []
    i = 0
    while i < length
        tmp = []
        j = 0
        while j < arr.length
            tmp << arr[j][i]
            j+=1
        end
        new_arr << tmp
        i+=1
    end
    new_arr
end

def max(arr)
    max = 0
    arr.each do |subarr|
        if subarr.length > max
            max = subarr.length
        end
    end
    max
end

def maximum(arr, &prc)
  max = arr[0]
  arr.each do |ele|
    if prc.call(ele) >= prc.call(max)
      max = ele
    end
  end
  max
end

def my_group_by(arr, &prc)
  hash = Hash.new { |h, k| h[k] = [] }
  arr.each do |ele|
    hash[prc.call(ele)] << ele
  end
  hash
end

def max_tie_breaker(arr, prc1, &prc2)
  return nil if arr.empty?
  largest = ""
  arr.each do |ele|
    if prc2.call(ele) > prc2.call(largest)
      largest = ele
    elsif prc2.call(ele) == prc2.call(largest) && prc1.call(ele) > prc1.call(largest)
      largest = ele
    end
  end
  largest
end

def silly_syllables(sent)
    new_arr = []
  arr = sent.split(" ")
  arr.each do |ele|
    if indices(ele).length < 2
        new_arr << ele
    else
        new_arr << update(ele)
    end
  end
  new_arr.join(" ")
end

def indices(str)
  vowels = "aeiouAeiou"
  idx = []
  str.each_char.with_index do |char, i|
    idx << i if vowels.include?(char)
  end
  idx
end

def update(word)
 id = indices(word)
 word[id[0]..id[-1]]
end