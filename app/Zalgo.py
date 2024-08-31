def getzarr(string, z):
    n = len(string)

    l, r, k = 0, 0, 0
    for i in range(1,n):
        l,r == i,i

        while r < n and string[r-l] == string[r]:
            r += 1
        z[i] = r - l 
        r-=1
    else:

        k = i -1

        if z[k] < r - i + 1:
            z[i] = z[k]

        else:

            l = i
            while r < n and string[r -l] == string[r]:
                r += 1

            z[i] = r -l 
            r -= 1

def search( text, pattern):

    concat = pattern + "$" + text
    l = len(concat)

    z = [0] * l 

    getzarr(concat, z)

    for i in range(l):

        if z[i] == len(pattern):
            print("pattern found at index", i -len(pattern)-1)


if __name__ == "__main__":
    text = "ajdjdfh"
    pattern = "af"
    search(text, pattern)