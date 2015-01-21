from matplotlib.font_manager import FontProperties
from pylab import *
x1 = [354, 5170, 51208, 205616, 718068, 1104599]
x2 = [780, 340, 730, 800, 430, 350]
y = [1000, 10000, 100000, 300000, 800000, 1000000]

#plot(x,y)
#plot(c = 'red', label = 'V', alpha = 0.3, linestyle='dashed', x1, y, c = 'green', label = 'native', alpha = 0.5, x2, y)
#scatter(x, y, c='red', s=20, label='custom', alpha=0.3, edgecolors='none')
plot(y,x1, c = 'red', label = 'custom')
# plot(y,x2, c = 'green', label = 'native')
title('insert at beggin, custom implimentation')
xlabel('elements count')
ylabel('time, nanoseconds')
legend()
grid(True)

show()


plot(y,x2, c = 'green', label = 'native')
title('insert at beggin, custom implimentation')
xlabel('elements count')
ylabel('time, nanoseconds')
legend()
grid(True)
show()
