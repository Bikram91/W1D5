def zip(*arr)
    new_arr = []
      i = 0
    while i < arr[0].length
      tmp_arr = []
      j = 0
      while j < arr.length
        tmp_arr << arr[j][i]
        j+=1
      end
      new_arr << tmp_arr
      
      i+=1
    end
    new_arr
  end 


def prizz_proc(arr, prc1, prc2)
    new_arr = []
    arr.each do |num|
        if (prc1.call(num) || prc2.call(num)) && (!prc1.call(num) || !prc2.call(num))
            new_arr << num
        end
    end
    new_arr
end

def zany_zip(*arr)
    new_arr = []
    i = 0
    while i < (arr.max).length
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

def maximum(arr, &prc)
    max = arr[0]
    arr.each do |ele|
        if  prc.call(ele) >= prc.call(max)
            max = ele
        end
    end
    max
end

def my_group_by(arr, &prc)
    hash = Hash.new {|h,k| h[k]= []}
    arr.each do |ele|
        hash[prc.call(ele)] << ele
    end
    hash 
end

# def max_tie_breaker(arr, breaker, &prc)
#     max = arr[0]
#     arr[1..-1].each do |ele|
#         if prc.call(ele) > prc.call(max)
#             max = ele
#         else prc.call(ele) == prc.call(max) && breaker.call(ele) > breaker.call(max)
#             max = ele
#         end
#     end
#     max
# end

def max_tie_breaker(arr, breaker, &prc)
    i = 1
    max = arr[0]
    while i < arr.length
        if prc.call(arr[i]) > prc.call(max)
            max = arr[i]
        elsif prc.call(arr[i]) == prc.call(max) && breaker.call(arr[i]) > breaker.call(max)
            max = arr[i]
        end
        i += 1
    end
    max
end