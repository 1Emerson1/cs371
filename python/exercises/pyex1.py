# pyex1.pl - Play with indentation

x = 1
if x == 1:
    y = 3
    if y == 2:
        print('in block2')
    else:
        print('y is not 2')
    print("in block1")
print('in block0')
