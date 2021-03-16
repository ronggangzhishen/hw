#------
#KNN
#------

#'minkowski'
def distance(a1, a2, p):
    d = 0
    for i in range(len(a1) - 1):
        d += (a1[i] - a2[i]) ** p
    return d ** 1/p


def knn(K, p, x_test, y_test, x_train, y_train):
    cnt = 0
    tp = 0
    fp = 0
    fn = 0
    tn = 0
    y_test_predict = []
    for j in range(len(x_test)):
        minindex = []
        count = 0
        dist = [distance(x_test[j], tx, p) for tx in x_train]
        maxdistance = max(dist)

        #记录最近的点下标
        for i in range(K):
            tindex = dist.index(min(dist))
            minindex.append(tindex)
            dist[tindex] = maxdistance

        #统计测试结果
        for i in minindex:
            count += y_train[i]
        
        #近处的哪个多就是哪个
        predict = round(count/K)
        y_test_predict.append(predict)

        if predict == y_test[j]:
            cnt += 1
        
        if predict == 1 and y_test[j] == 1:
            tp += 1
        elif predict == 1 and y_test[j] == 0:
            fp += 1
        elif predict == 0 and y_test[j] == 1:
            fn += 1
        else:#predict == 0 and y_test[j] == 0:
            tn += 1

    f1socre = 2 / ((tp+fp)/tp + (tp+fn)/tp)
    return cnt, f1socre, y_test_predict
