import math
import pandas as pd
import tensorflow as tf

#sys.stdout = open('output.txt','w')
#outputfile = open('output.txt','w')
file = pd.read_excel('cafedata_kor.xlsx')
file=file.dropna(axis=0) #중간에 공백 있는 사람들 지워줌
sheet = file.values.tolist()

menu = [[0]*13 for j in range(32)] #첫번째는 메뉴, 두번째부터는 월별 판매량
cafe_menu = ['바닐라라떼','카라멜라떼','헤이즐넛라떼', '아메리카노',
             '카페라떼', '카푸치노','바닐라마끼아또', '카라멜마끼아또',
             '헤이즐넛마끼아또', '화이트모카', '카페모카', '카라멜모카',
             '핫초코', '화이트초코', '그린티라떼', '로얄밀크티',
             '청포도', '딸기바나나', '플레인요거트', '블루베리요거트',
             '얼그레이','캐모마일','페퍼민트','그린티', '복숭아아이스티',
             '자몽차','레몬차', '유자차', '자두주스',
             '자몽에이드', '레몬에이드', '유자에이드']

for i in range(32):
    menu[i][0] = cafe_menu[i]
    
def MENU_CHECK(month, order):
    if order == "핫바닐라라떼" or order == "아이스바닐라라떼" :
        menu[0][month] = menu[0][month]+1
    elif order == "핫카라멜라떼" or order == "아이스카라멜라떼" : 
        menu[1][month] = menu[1][month]+1
    elif order ==  "핫헤이즐넛라떼" or order == "I아이스헤이즐넛라떼" :
        menu[2][month] = menu[2][month]+1
    elif order == "핫바닐라마끼아또" or order == "아이스바닐라마끼아또":
        menu[6][month] = menu[6][month]+1
    elif order == "카라멜마끼아또" or order == "아이스카라멜마끼아또": 
        menu[7][month] = menu[7][month]+1
    elif order ==  "핫헤이즐넛마끼아또" or order == "아이스헤이즐넛마끼아또": 
        menu[8][month] = menu[8][month]+1
    elif order == "핫아메리카노" or order == "아이스아메리카노" :
        menu[3][month] = menu[3][month]+1
    elif order == "핫카페라떼" or order == "아이스카페라떼" :
        menu[4][month] = menu[4][month]+1
    elif order == "핫카푸치노" or order == "아이스카푸치노" :
        menu[5][month] = menu[5][month]+1
    elif order == "핫화이트모카" or order == "아이스화이트모카" :
        menu[9][month] = menu[9][month]+1
    elif order == "핫카페모카" or order == "아이스카페모카" :
        menu[10][month] = menu[10][month]+1
    elif order == "핫카라멜모카" or order == "아이스카라멜모카" :
        menu[11][month] = menu[11][month]+1
    elif order == "핫초코" or order == "아이스초코" :
        menu[12][month] = menu[12][month]+1
    elif order == "핫화이트초코" or order == "아이스화이트초코" :
        menu[13][month] = menu[13][month]+1
    elif order == "핫그린티라떼" or order == "아이스그린티라떼" :
        menu[14][month] = menu[14][month]+1
    elif order == "핫로얄밀크티" or order =="아이스로얄밀크티" :
        menu[15][month] = menu[15][month]+1
    elif order == "청포도" :
        menu[16][month] = menu[16][month]+1
    elif order == "딸기바나나" :
        menu[17][month] = menu[17][month]+1
    elif order == "플레인요거트" :
        menu[18][month] = menu[18][month]+1
    elif order == "블루베리요거트":
        menu[19][month] = menu[19][month]+1
    elif order == "핫얼그레이" or order == "아이스얼그레이" :
        menu[20][month] = menu[20][month]+1
    elif order == "핫캐모마일" or "아이스캐모마일":
        menu[21][month] = menu[21][month]+1
    elif order == "핫페퍼민트" or "아이스페퍼민트" :
        menu[22][month] = menu[22][month]+1
    elif order == "핫자몽차" or "아이스자몽차" :
        menu[25][month]+= 1
    elif order == "핫레몬차" or "아이스레몬차":
        menu[26][month]+= 1
    elif order == "핫유자차" or "아이스유자차" :
        menu[27][month]+= 1
    elif order == "핫자몽에이드" or "아이스자몽에이드" :
        menu[29][month]+= 1
    elif order == "핫레몬에이드" or "아이스레몬에이드":
        menu[30][month]+= 1
    elif order == "핫유자에이드" or "아이스유자에이드" :
        menu[31][month]+= 1
    elif order == "복숭아아이스티":
        menu[24][month]+= 1
    elif order == "자두주스":
        menu[28][month]+= 1
    elif order == "핫그린티" or "아이스그린티":
        menu[23][month]+= 1

for i in range(len(file)): #공백 있는 사람들을 제외한 사람 수
    for j in range(10):
        date = (float(sheet[i][j+11])-180000)/100 #날짜에서 월만 저장해서 사용
        date = math.floor(date)
        
        if date == 1:
            MENU_CHECK(1, sheet[i][j+1])
        elif date == 2:
            MENU_CHECK(2,sheet[i][j+1])
        elif date == 3:
            MENU_CHECK(3,sheet[i][j+1])
        elif date == 4:
            MENU_CHECK(4,sheet[i][j+1])
        elif date == 5:
            MENU_CHECK(5,sheet[i][j+1])
        elif date == 6:
            MENU_CHECK(6,sheet[i][j+1])
        elif date == 7:
            MENU_CHECK(7,sheet[i][j+1])
        elif date == 8:
            MENU_CHECK(8,sheet[i][j+1])
        elif date == 9:
            MENU_CHECK(9,sheet[i][j+1])
        elif date == 10:
            MENU_CHECK(10,sheet[i][j+1])
        elif date == 11:
            MENU_CHECK(11,sheet[i][j+1])
        elif date == 12:
            MENU_CHECK(12,sheet[i][j+1])
            

x_data = [8, 9, 10] #3개월
y_data = [[0]*3 for i in range(32)] #'3'은 추후에 수정가능
for i in range(32):
    for j in range(3): 
        y_data[i][j] = menu[i][j+x_data[0]-1] #월별 해당 메뉴 판매량, -1은 인덱스이므로

x = tf.placeholder(tf.float32, shape = [None])
Y = [0 for i in range(32)]
w = [0 for i in range(32)]
b = [0 for i in range(32)]
hypothesis = [0 for i in range(32)]
cost = [0 for i in range(32)]
train = [0 for i in range(32)]
predicted = [0 for i in range(32)]
accuracy = [0 for i in range(32)]
cost_val = [0 for i in range(32)]
w_val = [0 for i in range(32)]
b_val = [0 for i in range(32)]

for i in range(32) :
    Y[i] = tf.placeholder(tf.float32, shape = [None])

    w[i] = tf.Variable(tf.random_normal([1]))
    b[i] = tf.Variable(tf.random_normal([1]))
    
    hypothesis[i] = x*w[i] + b[i]
    
    cost[i] = tf.reduce_mean(tf.square(hypothesis[i] - Y[i]))

optimizer  = tf.train.GradientDescentOptimizer(learning_rate = 0.01)

for i in range(32) :
    train[i] = optimizer.minimize(cost[i])

    predicted[i] = tf.cast(hypothesis[i] > 0.5, dtype = tf.float32)
    
    accuracy[i] = tf.reduce_mean(tf.cast(tf.equal(predicted[i], Y[i]), dtype=tf.float32))

sess = tf.Session()
sess.run(tf.global_variables_initializer())


for step in range(2001) :
    for i in range(32):
        cost_val[i], w_val[i], b_val[i], _ = sess.run([cost[i], w[i], b[i], train[i]],
                                          feed_dict = {x : x_data, Y[i] : [y_data[i][0], y_data[i][1], y_data[i][2]]})

#재고예측
coffee = 0
car_water = 0
milk = 0
'''
if x_data[-1] == 12 :
    next_month = 1
else :
    next_month = x_data[-1]+1
'''
next_month = x_data[-1]+1
    
for i in range(12) :
    coffee += w_val[i]*next_month+b_val[i]

for i in range(3) :
    car_water += w_val[i+29]*next_month+b_val[i+29]
    
for i in range(20):
    milk += w_val[i]*next_month+b_val[i]
milk -= w_val[3]*next_month+b_val[3]

vanilla = w_val[0]*next_month+b_val[0]+w_val[6]*next_month+b_val[6]
caramel = w_val[1]*next_month+b_val[1]+w_val[7]*next_month+b_val[7]
hazelnut = w_val[2]*next_month+b_val[2]+w_val[8]*next_month+b_val[8]

choco = w_val[10]*next_month+b_val[10]+w_val[11]*next_month+b_val[11]+ w_val[12]*(x_data[-1]+1)+b_val[12]
whitechoco = w_val[9]*next_month+b_val[9]

greentea = w_val[14]*next_month+b_val[14]+w_val[23]*(x_data[-1]+1)+b_val[23]
milktea = w_val[15]*next_month+b_val[15]

whitegrape = w_val[16]*next_month+b_val[16]
strawberry = w_val[17]*next_month+b_val[17]
banana = w_val[17]*next_month+b_val[17]
blueberry = w_val[19]*next_month+b_val[19]
plum = w_val[28]*next_month+b_val[28]

syrup = w_val[17]*next_month+b_val[17]+w_val[19]*next_month+b_val[19]
yogurt = w_val[18]*next_month+b_val[18]+w_val[19]*next_month+b_val[19]

earlgrey = w_val[20]*next_month+b_val[20]
chamomile = w_val[21]*next_month+b_val[21]
peppermint = w_val[22]*next_month+b_val[22]
icetea =  w_val[24]*next_month+b_val[24]

grapefruit = w_val[25]*next_month+b_val[25]+ w_val[29]*next_month+b_val[29]
lemon = w_val[26]*next_month+b_val[26]+ w_val[30]*next_month+b_val[30]
citrus = w_val[27]*next_month+b_val[27]+ w_val[31]*next_month+b_val[31]

'''
if coffee < 0 :
    coffee = 0
if earlgrey< 0 :
    earlgrey = 0
if peppermint < 0 :
    peppermint = 0
if chamomile < 0 :
    chamomile = 0
if milk < 0 :
    milk = 0
if whitegrape < 0 :
    whitegrape = 0
if strawberry < 0 :
    strawberry = 0
if banana < 0 :
    banana = 0
if greentea < 0 :
    greentea = 0
if milktea < 0 :
    milktea = 0
if yogurt < 0 :
    yogurt = 0
if icetea < 0 :
    icetea = 0
if vanilla < 0 :
    vanilla = 0
if hazelnut < 0 :
    hazelnut = 0
if caramel < 0 :
    caramel = 0
if choco < 0 :
    choco = 0
if whitechoco < 0 :
    whitechoco = 0
if blueberry < 0 :
    blueberry = 0
if grapefruit < 0 :
    grapefruit = 0
if citrus < 0 :
    citrus = 0
if lemon < 0 :
    lemon = 0
'''    
        
#다음달 필요 재고 (단, 모든 재료는 1kg 기준)
print("원두는 ",format(float(coffee/50), '.2f'), "kg 필요")

print("얼그레이는 ", format(float(earlgrey/100), '.2f'),"kg 필요")
print("페퍼민트는 ", format(float(peppermint/100), '.2f'),"kg 필요")
print("캐모마일은 ",format(float(chamomile/100), '.2f'),"kg 필요")

print("우유는 ",format(float(milk/5), '.2f'),"kg 필요")
print("청포도는 ",format(float(whitegrape/10), '.2f'),"kg 필요")
print("딸기는 ",format(float(strawberry/10), '.2f'),"kg 필요")
print("바나나는 ",format(float(banana/10), '.2f'), "kg 필요")

print("그린티는 ",format(float(greentea/25), '.2f'),"kg 필요")
print("밀크티는 ",format(float(milktea/25), '.2f'),"kg 필요")
print("요거트는 ",format(float(yogurt/25), '.2f'),"kg 필요")
print("월 복숭아아이스티는 ",format(float(icetea/25), '.2f'),"kg 필요")

print("바닐라시럽은 ",format(float(vanilla/40), '.2f'),"kg 필요")
print("헤이즐넛시럽은 ",format(float(hazelnut/40), '.2f'),"kg 필요")
print("카라멜시럽은 ",format(float(caramel/40), '.2f'),"kg 필요")
print("초코시럽은 ",format(float(choco/40), '.2f'),"kg 필요")
print("화이트초코시럽은 ",format(float(whitechoco/40), '.2f'),"kg 필요")
print("블루베리는 ",format(float(blueberry/40), '.2f'),"kg 필요")
print("자몽은 ",format(float(grapefruit/40), '.2f'),"kg 필요")
print("유자는 ",format(float(citrus/40), '.2f'),"kg 필요")
print("레몬은 ",format(float(lemon/40), '.2f'),"kg 필요")

