#-*- coding:utf-8 -*-
import pandas
from mlxtend.preprocessing import TransactionEncoder
from mlxtend.frequent_patterns import apriori, association_rules
from operator import eq

def frequentPattern(userInput):
    data = pandas.read_csv('C:\\Users\\smu\\Python\\frequentPattern\\cafedata3.csv', engine='python', encoding='CP949')
    data = data.dropna(axis=0)
    transactions = data.values.tolist()
    for x in transactions :
        del x[0]
        del x[10:]
    #print(transactions)
    te = TransactionEncoder()
    te_ary = te.fit(transactions).transform(transactions)
    df = pandas.DataFrame(te_ary, columns=te.columns_)
    frequentItems = apriori(df, min_support=0.05, use_colnames=True)
    #규칙(A를 사면 B를 산다)을 찾을 건데 적어도 그 규칙이 나타날 확률이 5% 이상은 되어야 해
    res = association_rules(frequentItems, metric="lift", min_threshold=1)
    res = res.sort_values('confidence', ascending=False)
    res = res[['antecedents', 'consequents', 'confidence']] 
    #print(res[['antecedents', 'consequents', 'confidence']])
    #print(res.values)
    lst = res.values.tolist()
    #print(lst)
    for element in lst:
        #print(element)
        stri = ""
        first, second, third, = element
        for x in first:
            stri += str(x)
            stri += ' '
        stri = stri.strip()
        if eq(stri, userInput):
            ##print('%d.' %(num), end=' ')
            print('%.1f명은 ' %(third*100),end='')
            print(', '.join(second), end='\n')
            ##print('도 %.3f%%' %(third*100))
    
pattern = '핫아메리카노'
frequentPattern(pattern)
