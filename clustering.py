import pandas as pd
import numpy as np
from sklearn import datasets
from sklearn.cluster import dbscan
import sys

def distance(a,n,m):
    sum_edit=0
    for i in range(1,len(a[n])):
        dist = levenshteinDistance(a[n][i],a[m][i])
        if(dist):
            sum_edit = sum_edit + 1
    return sum_edit

def levenshteinDistance(s1, s2):
    if len(s1) > len(s2):
        s1, s2 = s2, s1

    distances = range(len(s1) + 1)
    for i2, c2 in enumerate(s2):
        distances_ = [i2+1]
        for i1, c1 in enumerate(s1):
            if c1 == c2:
                distances_.append(distances[i1])
            else:
                distances_.append(1 + min((distances[i1], distances[i1 + 1], distances_[-1])))
        distances = distances_
    return distances[-1]

sublevel_map = {
    '아이스바닐라라떼' : 'A',
    '핫바닐라라떼' : 'B',
    '아이스카라멜라떼' : 'C',
    '핫카라멜라떼' : 'D',
    '아이스헤이즐넛라떼' : 'E',
    '핫헤이즐넛라떼' : 'F',
    
    '아이스아메리카노' : 'G',
    '핫아메리카노' : 'H',
    '아이스카페라떼' : 'I',
    '핫카페라떼' : 'J',
     #주의 
    '아이스카푸치노' : 'K',
    '핫카푸치노' : 'L',
    
    '아이스바닐라마끼아또' : 'M',
    '핫바닐라마끼아또' : 'N',
    '카라멜마끼아또' : 'O',
    '핫카라멜마끼아또' : 'P',
    '아이스헤이즐넛마끼아또' : 'Q',
    '핫헤이즐넛마끼아또' : 'R',
    
    '아이스화이트모카' : 'S',
    '핫화이트모카' : 'T',
    '아이스카페모카' : 'U',
    '핫카페모카' : 'V',
    '아이스카라멜모카' : 'W',
    '핫카라멜모카' : 'X',
    
    '아이스초코' : 'Y',
    '핫초코' : 'Z' ,
    '아이스화이트초코' : '1',
    '핫화이트초코' : '2',
    '아이스그린티라떼' : '3',
    '핫그린티라떼' : '4',
    '아이스로얄밀크티' : '5',
    '핫로얄밀크티' : '6',
    
    '청포도' : '7',
    '딸기바나나' : '8',
    
    '플레인요거트' : '9',
    '블루베리요거트' : '~',
    
    '핫얼그레이' : '!',
    '아이스캐모마일' : '@',
    '핫페퍼민트' : '#',
    
    '아이스자몽티' : '$',
    '핫자몽티' : '%',
    '아이스레몬티' : '^',
    '핫레몬티' : '&',
    '아이스유자차' : '*',
    '핫유자차' : '(',
    '복숭아아이스티' : ')',
    '아이스그린티' : '-',
    '핫그린티' : '+',
    
  
    '자몽에이드' : '=',
    '레몬에이드' : ']',
    '유자에이드' : '<',
    
    '자두주스' : '?'
}

#data = pd.read_excel('cafedata_kor.xlsx')
data = pd.read_excel(sys.argv[1])
data['메뉴1'] = data['메뉴1'].map(sublevel_map)
data['메뉴2'] = data['메뉴2'].map(sublevel_map)
data['메뉴3'] = data['메뉴3'].map(sublevel_map)
data['메뉴4'] = data['메뉴4'].map(sublevel_map)
data['메뉴5'] = data['메뉴5'].map(sublevel_map)
data['메뉴6'] = data['메뉴6'].map(sublevel_map)
data['메뉴7'] = data['메뉴7'].map(sublevel_map)
data['메뉴8'] = data['메뉴8'].map(sublevel_map)
data['메뉴9'] = data['메뉴9'].map(sublevel_map)
data['메뉴10'] = data['메뉴10'].map(sublevel_map)
data=data.dropna(axis=0)



new = data["메뉴2"].copy()
data["메뉴1"]=data["메뉴1"].str.cat(new)
new = data["메뉴3"].copy()
data["메뉴1"]=data["메뉴1"].str.cat(new)
new = data["메뉴4"].copy()
data["메뉴1"]=data["메뉴1"].str.cat(new)
new = data["메뉴5"].copy()
data["메뉴1"]=data["메뉴1"].str.cat(new)
new = data["메뉴6"].copy()
data["메뉴1"]=data["메뉴1"].str.cat(new)
new = data["메뉴7"].copy()
data["메뉴1"]=data["메뉴1"].str.cat(new)
new = data["메뉴8"].copy()
data["메뉴1"]=data["메뉴1"].str.cat(new)
new = data["메뉴9"].copy()
data["메뉴1"]=data["메뉴1"].str.cat(new)
new = data["메뉴10"].copy()
data["메뉴1"]=data["메뉴1"].str.cat(new)
# concatenating team with name column 
# overwriting name column 

mydata = data["메뉴1"]

def myfun(var):
    mylist = [x for x in var]
    typ = []
    ch_var = ["0","0","0","0","0","0","0","0","0","0"] #바꾼스트링
    alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    count = 0
    
    ###이전에 종류가 나왔었는지 안나왔었는지 체크할때, 다찾았는데도, 없으면 종류에 새로 넣어줘야하는데, 체크를 하기 위해서 초기화가 필요함. 

    #첫번째 메뉴!!!! 일단 종류로 넣어주고, 카운트해주고, 새로운리스트에 첫번째 메뉴를 'A'로바꿔야함.
    typ.append(mylist[0])
    count = count + 1
    ch_var[0]=alphabet[count-1]

  
    #방금체크한메뉴k가 이전에 나왔던건지typ(count) 체크해보고, 그번호로 바꿔야함.
    for k in range(1,len(mylist)):  
        for j in range(count):
            if(mylist[k]==typ[j]):#이전에 나왔던거라면, 몇번째인지는 j가 체크해준거니까 alphabet[j]값으로 새로운리스트에 넣어줘야지.  
                ch_var[k] = alphabet[j]
        if(ch_var[k]=="0"): #다찾고 나왔는데,없어...그럼 어떻게 하냐면, 새로 넣어줘야지.(새로운 종류가 나온거니까)
            typ.append(mylist[k])
            count = count+ 1
            ch_var[k]= alphabet[count-1]
    
    return ''.join(ch_var)


mylist = mydata.values.tolist()
for i in range(len(mylist)):
    #print("바꾸기전입니다. "+mylist[i])
    mylist[i]=myfun(mylist[i])
    #print("바꾼 후 입니다. "+mylist[i])

changed_data = pd.DataFrame(mylist)

import numpy as np
import sklearn.cluster
from nltk.metrics import edit_distance
import distance
from scipy import spatial
import jellyfish

changed_data = np.asarray(mylist)

similarity = -1*np.array([[edit_distance(w1,w2) for w1 in changed_data] for w2 in changed_data])
affprop = sklearn.cluster.AffinityPropagation(affinity="precomputed", preference = -25 , damping=0.5)
affprop.fit(similarity)

count = [0,0,0,0]

for a in affprop.labels_:
    if(a == 0):
        count[0] = count[0] + 1
    elif(a == 1):
        count[1] = count[1] + 1
    elif(a == 2):
        count[2] = count[2] + 1
    else :
        count[3] = count[3] + 1

#print(len(affprop.labels_)) 각각 어느클러스터에 속해있는지 알수있는 배열형태
#print(affprop.cluster_centers_indices_) 센터의 인덱스(위치)를 알수 있는배열형태

for cluster_id in np.unique(affprop.labels_):
    exemplar = changed_data[affprop.cluster_centers_indices_[cluster_id]]
    cluster = np.unique(changed_data[np.nonzero(affprop.labels_==cluster_id)])
    cluster_str = ", ".join(cluster)
    percentage = round(count[cluster_id]/len(affprop.labels_),3)*100
    print("Cluster %s : %.4s%% - center *%s:* " % ( cluster_id+1, percentage ,exemplar))
    #print("%s Percentage - *%s:* %s" % ( count[cluster_id]/len(affprop.labels_) ,exemplar, cluster_str))
    
