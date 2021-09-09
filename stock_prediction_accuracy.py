import math
import pandas as pd
import tensorflow as tf

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



    
#재고계산
coffee = 0
car_water = 0
milk = 0

for i in range(12) :
        coffee += menu[i][11]
        
for i in range(3) :
    car_water += menu[i+29][11]
    
for i in range(20):
    milk += menu[i][11]
milk -= menu[i][11]

vanilla = menu[0][11]+menu[6][11]
caramel = menu[1][11]+menu[7][11]
hazelnut = menu[2][11]+menu[8][11]

choco = menu[10][11]+menu[11][11]+ menu[12][11]
whitechoco = menu[13][11]

greentea = menu[14][11]+menu[23][11]
milktea = menu[15][11]

whitegrape = menu[15][11]
strawberry = menu[17][11]

banana = menu[17][11]
blueberry = menu[19][11]
plum = menu[28][11]

syrup = menu[17][11]+menu[19][11]
yogurt = menu[18][11]+menu[19][11]

earlgrey = menu[20][11]
chamomile = menu[21][11]
peppermint = menu[22][11]
icetea =  menu[24][11]

grapefruit = menu[25][11]+menu[29][11]
lemon = menu[26][11]+menu[30][11]
citrus = menu[27][11]+menu[31][11]


#다음달 필요 재고 (단, 모든 재료는 1kg 기준)
print("모든 재료는 1kg 기준으로 계산됩니다.\n")

print("원두는 ",(coffee/50),"통 필요")

print("얼그레이는 ",(earlgrey/100),"통 필요")
print("페퍼민트는 ",(peppermint/100),"통 필요")
print("캐모마일은 ",(chamomile/100),"통 필요")

print("우유는 ",(milk/5),"통 필요")
print("청포도는 ",(whitegrape/10),"통 필요")
print("딸기는 ",(strawberry/10),"통 필요")
print("바나나는 ",(banana/10),"통 필요")

print("그린티는 ",(greentea/25),"통 필요")
print("밀크티는 ",(milktea/25),"통 필요")
print("요거트는 ",(yogurt/25),"통 필요")
print("복숭아아이스티는 ",(icetea/25),"통 필요")

print("바닐라시럽은 ",(vanilla/40),"통 필요")
print("헤이즐넛시럽은 ",(hazelnut/40),"통 필요")
print("카라멜시럽은 ",(caramel/40),"통 필요")
print("초코시럽은 ",(choco/40),"통 필요")
print("화이트초코시럽은 ",(whitechoco/40),"통 필요")
print("블루베리는 ",(blueberry/40),"통 필요")
print("자몽은 ",(grapefruit/40),"통 필요")
print("유자는 ",(citrus/40),"통 필요")
print("레몬은 ",(lemon/40),"통 필요")

