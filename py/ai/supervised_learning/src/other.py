#------------
#实现朴素贝叶斯 Naive Bayes分类
#-------------

def com_freq(x, y):
    labelnum = len(x[0])
    #规定值域
    maxindex = 21

    #每个标签的值域为[0,20]
    truecnt = [[0 for x in range(maxindex)] for i in range(labelnum)]
    totalcnt = [[0 for x in range(maxindex)] for i in range(labelnum)]

    #对所有数据统计
    for i in range(len(x)):
        #统计每一个label为真的次数
        if y[i] == 1:
            for j in range(labelnum):
                truecnt[j][x[i][j]] += 1
        #统计每一个label总出现次数
        for j in range(labelnum):
            totalcnt[j][x[i][j]] += 1

    #计算频率当概率
    posibility = [[0 for x in range(maxindex)] for i in range(labelnum)]
    for i in range(maxindex):
        for j in range(labelnum):
            if totalcnt[j][i] != 0:
                posibility[j][i] = truecnt[j][i] / totalcnt[j][i]
    return posibility


def bayes(x_train, y_train, x_test, y_test):
    posibility = com_freq(x_train, y_train)
    #print(posibility)

    #各标签的权值相同,计算总概率
    cnt = 0
    tp = 0
    fp = 0
    fn = 0
    tn = 0
    y_test_predict = []
    labelnum = len(x_test[0])
    for i in range (len(x_test)):
        sum = 0
        for j in range(labelnum):
            sum += posibility[j][x_test[i][j]]
        
        predict = round(sum/labelnum)
        y_test_predict.append(predict)

        if predict == y_test[i]:
            cnt += 1
        
        if predict == 1 and y_test[i] == 1:
            tp += 1
        elif predict == 1 and y_test[i] == 0:
            fp += 1
        elif predict == 0 and y_test[i] == 1:
            fn += 1
        else:#predict == 0 and y_test[i] == 0:
            tn += 1

    f1socre = 2 / ((tp+fp)/tp + (tp+fn)/tp)
    return cnt, f1socre, y_test_predict

    
