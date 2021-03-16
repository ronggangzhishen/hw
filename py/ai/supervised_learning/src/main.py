#--------------
#main.py
#--------------
import numpy as np
from KNN import knn
from SVM import testRbf
from other import bayes
import csv
import sys


def preprocess(filename1):
    x = []
    y = []
    with open('../data/' + filename1, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            #30:G1 31:G2 32:G3, 其它数据不使用
            t = list(row.values())[0].split(';')
            x.append([int(t[30].split('"')[1]), int(t[31].split('"')[1])])
            y.append(int(t[32]))
    x = np.array(x)
    y = np.array(y)

    return x, y

# >=10 => 1, <10 => 0
def normalizey(a1, lenth):
    for i in range(lenth):
        if a1[i] >= 10:
            a1[i] = 1
        else:
            a1[i] = 0

def normalize0(a1):
    for i in range(len(a1)):
        if a1[i] == 0:
            a1[i] = -1

def normalizex(a1, lenth):
    for i in range(lenth):
        if a1[i][0] >= 10:
            a1[i][0] = 1
        else:
            a1[i][0] = 0
        if a1[i][1] >= 10:
            a1[i][1] = 1
        else:
            a1[i][1] = 0


def main():
    x, y = preprocess('student-mat.csv')
    print(x.shape, y.shape)

    # 70%的数据用于训练
    num_training = int(0.7*len(x))
    num_test = len(x) - num_training
    x_train = x[:num_training]
    y_train = y[:num_training]
    x_test = x[num_training:]
    y_test = y[num_training:]
    # 01化
    # normalizex(x_train, num_training)
    normalizey(y_train, num_training)
    # normalizex(x_test, num_test)
    normalizey(y_test, num_test)

    '''
    import matplotlib.pyplot as plt
    temp0x0 = []
    temp0x1 = []
    temp1x0 = []
    temp1x1 = []
    for i in range(len(x)):
        if y[i]:
            temp1x0.append(x[i][0])
            temp1x1.append(x[i][1])
        else:
            temp0x0.append(x[i][0])
            temp0x1.append(x[i][1])
    plt.plot(temp1x0, temp1x1, 'g^', temp0x0, temp0x1, 'bs')
    plt.axis([0, 21, 0, 21])
    plt.xlabel('x0')
    plt.ylabel('x1')
    plt.show()
    '''
    #选择算法
    if sys.argv[1] == 'knn':
        print('KNN')
        for k in range(1, 21):
            hit_cnt, f1socre, y_test_pre = knn(k, 2, x_test, y_test, x_train, y_train)
            print('K = ',k,', hit rate = ',hit_cnt/num_test,'f1score = ',f1socre)
    elif sys.argv[1] == 'svm':
        print('SVM')
        normalize0(y_train)
        normalize0(y_test)
        testRbf(200, x_train, y_train, x_test, y_test)
        for C in range(8):
            hit_cnt, f1socre, y_test_pre = testRbf(200, x_train, y_train, x_test, y_test)
            print('C = ',C,', hit rate = ',hit_cnt/num_test,'f1score = ',f1socre)
    else:
        print('Naive Bayes')
        hit_cnt, f1socre, y_test_pre = bayes(x_train, y_train, x_test, y_test)
        print('hit rate = ',hit_cnt/num_test,'f1score = ',f1socre)

if __name__ == '__main__':
    main()

#-----------------------------

# python main.py knn