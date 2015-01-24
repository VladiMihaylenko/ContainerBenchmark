from matplotlib.font_manager import FontProperties
from pylab import *

capacity = [1000, 10000, 100000, 300000, 800000, 1000000]
# NSMutableDictipnary

deleteNative = [105, 35, 76, 106, 101, 63]
insertNative = [3154, 101, 347, 75, 135, 108]
searchNative = [48, 37, 53, 41, 41, 85]

plot(capacity, deleteNative, c = 'red', label = 'delete', alpha = 0.5, lw = 2)
plot(capacity, insertNative, c = 'green', label = 'insert', alpha = 0.5, lw = 2)
plot(capacity, searchNative, c = 'blue', label = 'search', alpha = 0.5, lw = 2)
title('NSMutableDictionary')
xlabel('elements count')
ylabel('time, nanoseconds')
legend()
grid(True)

show()

# CustomMutableDictionary

deleteCustom = [362, 4122, 3408, 1106, 1930, 1956]
insertCustom = [503, 488, 499, 768, 578, 412]
searchCustom = [91, 89, 2144, 170, 1510, 524]

plot(capacity, deleteCustom, c = 'red', label = 'delete', alpha = 0.5, lw = 2)
plot(capacity, insertCustom, c = 'green', label = 'insert', alpha = 0.5, lw = 2)
plot(capacity, searchCustom, c = 'blue', label = 'search', alpha = 0.5, lw = 2)
title('CustomMutableDictionary')
xlabel('elements count')
ylabel('time, nanoseconds')
legend()
grid(True)

show()

# NSMutableArray

insertAtStartNative = [46, 21, 16, 23, 21, 17]
insertAtEndNative = [30, 23, 20, 33, 21, 30]
randomRemoveNative = [428, 1830, 30914, 113080, 372899, 623904]
removeLastNative = [160, 121, 98, 128, 116, 112]
indexOfObjectNative = [60623, 666612, 6561044, 20468103, 49655793, 61725194]
objectAtIndexNative = [21, 27, 13, 15, 15, 16]

plot(capacity, insertAtStartNative, c = 'red', label = 'insert at start', lw = 2)
plot(capacity, insertAtEndNative, c = 'green', label = 'insert at end', lw = 2)
plot(capacity, randomRemoveNative, c = 'blue', label = 'random remove', lw = 2)
plot(capacity, removeLastNative, c = 'c', label = 'remove last', lw = 2)
plot(capacity, indexOfObjectNative, c = 'black', label = 'random access by object', lw = 2)
plot(capacity, objectAtIndexNative, c = 'magenta', label = 'random acces by index', lw = 2)
title('NSMutableArray')
xlabel('elements count')
ylabel('time, nanoseconds')
legend()
grid(True)

show()


# CustomMutableArray

insertAtStartCustom = [323, 3374, 83973, 132249, 836776, 1045885]
insertAtEndCustom = [151, 32, 44, 51, 70, 43]
randomRemoveCustom = [3020, 80400, 1137389, 3038842, 8414748, 11051069]
removeLastCustom = [200, 100, 94, 105, 110, 104]
indexOfObjectCustom = [77322, 707752, 7548987, 20103244, 52146460, 65193573]
objectAtIndexCustom = [ 25, 12, 11, 13, 13, 25]


plot(capacity, insertAtStartCustom, c = 'red', label = 'insert at start', lw = 2)

title('CustomMutableArray')
xlabel('elements count')
ylabel('time, nanoseconds')
legend()
grid(True)
show()

plot(capacity, insertAtEndCustom, c = 'green', label = 'insert at end', lw = 2)

title('CustomMutableArray')
xlabel('elements count')
ylabel('time, nanoseconds')
legend()
grid(True)
show()

plot(capacity, randomRemoveCustom, c = 'blue', label = 'random remove', lw = 2)

title('CustomMutableArray')
xlabel('elements count')
ylabel('time, nanoseconds')
legend()
grid(True)
show()

plot(capacity, removeLastCustom, c = 'c', label = 'remove last', lw = 2)

title('CustomMutableArray')
xlabel('elements count')
ylabel('time, nanoseconds')
legend()
grid(True)
show()

plot(capacity, indexOfObjectCustom, c = 'black', label = 'random access by object', lw = 2)

title('CustomMutableArray')
xlabel('elements count')
ylabel('time, nanoseconds')
legend()
grid(True)
show()

plot(capacity, objectAtIndexCustom, c = 'magenta', label = 'random acces by index', lw = 2)

title('CustomMutableArray')
xlabel('elements count')
ylabel('time, nanoseconds')
legend()
grid(True)

show()
