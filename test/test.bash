#!/bin/bash
# SPDX-FileCopyrightText: 2024 Itsuki Terasawa
# SPDX-License-Identifier: BSD-3-Clause


# テスト項目
#正常な入力を試す
    # 正常な入力を試す1(echo {モード番号} 3 1 0 0 x 1 0 0 y 1 0 0 z 1 0 0をパイプで入力)
        # モード1について
	# モード2について
	# モード3について
	# モード4について(角度の入力は30 45 90)
    # 正常な入力を試す2(横並びの{モード番号} 3 0 1 0 y 0 1 0 z 0 1 0 x 0 1 0をtxtファイルからリダイレクトで入力)
        # モード1について
	# モード2について
	# モード3について
	# モード4について(角度の入力は390 405 450)
    # 正常な入力を試す3(縦並びの{モード番号} 3 0 0 1 z 0 0 1 x 0 0 1 y 0 0 1をtxtファイルからリダイレクトで入力)
        # モード1について
	# モード2について
	# モード3について
	# モード4について(角度の入力は30 45 90)
    # 正常な入力を試す4(echo {モード番号} 3 100 100 0 x 0 100 100 y 100 0 100 z 100 100 100をパイプで入力)
        # モード1について
	# モード2について
	# モード3について
	# モード4について(角度の入力は-330 -315 -270)
    # 正常な入力を試す5(echo {モード番号} 3 -100 -100 0 x 0 -100 -100 y -100 0 -100 z -100 -100 -100をパイプで入力)
        # モード1について
	# モード2について
	# モード3について
	# モード4について(角度の入力は-690 -675 -630)
    # 正常な入力を試す6(echo {モード番号} 0 1 0 0をパイプで入力)
        # モード1について
	# モード2について
	# モード3について
	# モード4について
#異常な入力を試す
    # モード入力について
        # 1,2,3,4以外の数字を入力
	# 文字を入力
	# 記号を入力
	# 文字と記号と数字の混合の入力
	# 何も入力しない
    # 自由度の入力について
        # 負の値を入力
	# 文字を入力
	# 記号を入力
	# 文字と記号と数字の混合の入力
	# 何も入力しない
    # 位置ベクトルの入力について
        # x成分について
	    # 文字の入力
	    # 記号の入力
	    # 文字と記号と数字の混合の入力
	    # 何も入力しない
        # y成分について
	    # 文字の入力
	    # 記号の入力
	    # 文字と記号と数字の混合の入力
	    # 何も入力しない
        # z成分について
	    # 文字の入力
	    # 記号の入力
	    # 文字と記号と数字の混合の入力
	    # 何も入力しない
    # 回転軸ベクトルの入力について
        # x,y,z以外の文字の入力
	# 数字の入力
	# 記号の入力
	# 文字と記号と数字の混合の入力
	# 何も入力しない
    #手先の位置ベクトルの入力について
        # x成分について
	    # 文字の入力
	    # 記号の入力
	    # 文字と記号と数字の混合の入力
	    # 何も入力しない
        # y成分について
	    # 文字の入力
	    # 記号の入力
	    # 文字と記号と数字の混合の入力
	    # 何も入力しない
        # z成分について
	    # 文字の入力
	    # 記号の入力
	    # 文字と記号と数字の混合の入力
	    # 何も入力しない
        # モード4の角度の入力について
	    # 文字の入力
	    # 記号の入力
	    # 文字と記号と数字の混合の入力
	    # 何も入力しない


error () {
	echo AN ERROR HAS OCCURRED IN TEST$t_num
	res=1
	}

res=0

cd ~/robosys/robosys2024

#正常な入力を試す
# 正常な入力を試す1
# モード1(test1)
t_num=1
out=$(echo 1 3 1 0 0 x 1 0 0 y 1 0 0 z 1 0 0 | python fkmanipulator/fkmanipulator)
[ "${out}" = "[[1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta1)*sin(theta2) + 1.0*sin(theta3)*cos(theta1)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3) - 1.0*sin(theta2)*cos(theta1)]]" ] || error

# モード2(test2)
t_num=2
out=$(echo 2 3 1 0 0 x 1 0 0 y 1 0 0 z 1 0 0 | python fkmanipulator/fkmanipulator)
[ "${out}" = "[[1.0*cos(theta2)*cos(theta3) -1.0*sin(theta3)*cos(theta2)
  1.0*sin(theta2)]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)]]" ] || error

# モード3(test3)
t_num=3
out=$(echo 3 3 1 0 0 x 1 0 0 y 1 0 0 z 1 0 0 | python fkmanipulator/fkmanipulator)
[ "${out}" = "先端の位置ベクトルは: 0Pr =
[[1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta1)*sin(theta2) + 1.0*sin(theta3)*cos(theta1)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3) - 1.0*sin(theta2)*cos(theta1)]]
有顔ベクトルは: [a b c] =
[[1.0*cos(theta2)*cos(theta3) -1.0*sin(theta3)*cos(theta2)
  1.0*sin(theta2)]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)]]" ] || error

# モード4(test4)
t_num=4
out=$(echo 4 3 1 0 0 x 1 0 0 y 1 0 0 z 1 0 0 30 45 90 | python fkmanipulator/fkmanipulator)
[ "$out" = "#!/usr/bin/python3
import numpy as np
import matplotlib.pyplot as plt


# マニピュレータ再現折れ線グラフの座標
x = [0.0, 1.00000000000000, 2.00000000000000, 2.70710678118655,
 2.70710678118655]
y = [0.0, 0, 0, 0.353553390593274, 1.21957879437771]
z = [0.0, 0, 0, -0.612372435695794, -0.112372435695795]
# 有顔ベクトルの根本と先端の座標
a_x = [2.70710678118655, 2.70710678118655]
a_y = [1.21957879437771, 2.08560419816215]
a_z = [-0.112372435695795, 0.387627564304205]
b_x = [2.70710678118655, 2.00000000000000]
b_y = [1.21957879437771, 0.866025403784439]
b_z = [-0.112372435695795, 0.500000000000000]
c_x = [2.70710678118655, 3.41421356237309]
c_y = [1.21957879437771, 0.866025403784439]
c_z = [-0.112372435695795, 0.500000000000000]


# グラフの表示範囲を決定
# xとyの表示範囲
Max_mat = [max(x), max(y), max(z)]
Max_num = max(Max_mat)
Min_mat = [min(x), min(y), min(z)]
Min_num = min(Min_mat)
Max = np.float16(round(Max_num + 1, 1))
Min = np.float16(round(Min_num - 1, 1))
if abs(Max) > abs(Min):
    Range = abs(Max)
elif abs(Min) > abs(Max):
    Range = abs(Min)
else:
    Range = abs(Max)

# zの表示範囲
z_Max = np.float16(round(max(z)))
z_Min = np.float16(round(min(z)))

# 座標軸表示用
x_axis = np.array([[- Range, Range], [0, 0], [0, 0]])
y_axis = np.array([[0, 0], [- Range, Range], [0, 0]])
z_axis = np.array([[0, 0], [0, 0], [- 2 * Range, 2 * Range]])

# グラフ表示についての設定
fig = plt.figure()
ax = fig.add_subplot(projection='3d')

ax.set_ylim(- Range, Range)
ax.set_xlim(- Range, Range)
if abs(z_Max) > abs(z_Min):
    ax.set_zlim(z_Min, z_Min + 2 * Range)
elif abs(z_Min) > abs(z_Max):
    ax.set_zlim(z_Max - 2 * Range, z_Max)
else:
    ax.set_zlim(z_Min, z_Min + 2 * Range)

# 描画するグラフの設定
ax.plot(x_axis[0], x_axis[1], x_axis[2], label='x', color='#8b0000')
ax.plot(y_axis[0], y_axis[1], y_axis[2], label='y', color='#006400')
ax.plot(z_axis[0], z_axis[1], z_axis[2], label='z', color='#00008b')
ax.plot(x, y, z, marker='o', markersize=3, color='#b8860b')
ax.plot(a_x, a_y, a_z, color='red')
ax.plot(b_x, b_y, b_z, color='green')
ax.plot(c_x, c_y, c_z, color='blue')

ax.set_box_aspect((1, 1, 1))
ax.legend()

plt.show()" ] || error


# 正常な入力を試す2
# txtファイルからモード番号+3 0 1 0 Y 0 1 0 Z 0 1 0 X 0 1 0 (390 405 450)を横並びで入力
# モード1(test5)
t_num=5
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input01.txt)
[ "${out}" = "[[1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3) - 1.0*sin(theta2)*cos(theta1)]
 [1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta1)*sin(theta2) + 1.0*sin(theta3)*cos(theta1)]]" ] || error

# モード2(test6)
t_num=6
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input02.txt)
[ "${out}" = "[[1.0*cos(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)]
 [1.0*sin(theta2) 1.0*cos(theta2)*cos(theta3)
  -1.0*sin(theta3)*cos(theta2)]
 [-1.0*sin(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)]]" ] || error

# モード3(test7)
t_num=7
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input03.txt)
[ "${out}" = "先端の位置ベクトルは: 0Pr =
[[1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3) - 1.0*sin(theta2)*cos(theta1)]
 [1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta1)*sin(theta2) + 1.0*sin(theta3)*cos(theta1)]]
有顔ベクトルは: [a b c] =
[[1.0*cos(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)]
 [1.0*sin(theta2) 1.0*cos(theta2)*cos(theta3)
  -1.0*sin(theta3)*cos(theta2)]
 [-1.0*sin(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)]]" ] || error

# モード4(test8)
t_num=8
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input04.txt)
[ "$out" = "#!/usr/bin/python3
import numpy as np
import matplotlib.pyplot as plt


# マニピュレータ再現折れ線グラフの座標
x = [0.0, 0, 0, -0.612372435695794, -0.112372435695795]
y = [0.0, 1.00000000000000, 2.00000000000000, 2.70710678118655,
 2.70710678118655]
z = [0.0, 0, 0, 0.353553390593274, 1.21957879437771]
# 有顔ベクトルの根本と先端の座標
a_x = [-0.112372435695795, 0.500000000000000]
a_y = [2.70710678118655, 3.41421356237310]
a_z = [1.21957879437771, 0.866025403784438]
b_x = [-0.112372435695795, 0.387627564304205]
b_y = [2.70710678118655, 2.70710678118655]
b_z = [1.21957879437771, 2.08560419816215]
c_x = [-0.112372435695795, 0.500000000000000]
c_y = [2.70710678118655, 2.00000000000000]
c_z = [1.21957879437771, 0.866025403784439]


# グラフの表示範囲を決定
# xとyの表示範囲
Max_mat = [max(x), max(y), max(z)]
Max_num = max(Max_mat)
Min_mat = [min(x), min(y), min(z)]
Min_num = min(Min_mat)
Max = np.float16(round(Max_num + 1, 1))
Min = np.float16(round(Min_num - 1, 1))
if abs(Max) > abs(Min):
    Range = abs(Max)
elif abs(Min) > abs(Max):
    Range = abs(Min)
else:
    Range = abs(Max)

# zの表示範囲
z_Max = np.float16(round(max(z)))
z_Min = np.float16(round(min(z)))

# 座標軸表示用
x_axis = np.array([[- Range, Range], [0, 0], [0, 0]])
y_axis = np.array([[0, 0], [- Range, Range], [0, 0]])
z_axis = np.array([[0, 0], [0, 0], [- 2 * Range, 2 * Range]])

# グラフ表示についての設定
fig = plt.figure()
ax = fig.add_subplot(projection='3d')

ax.set_ylim(- Range, Range)
ax.set_xlim(- Range, Range)
if abs(z_Max) > abs(z_Min):
    ax.set_zlim(z_Min, z_Min + 2 * Range)
elif abs(z_Min) > abs(z_Max):
    ax.set_zlim(z_Max - 2 * Range, z_Max)
else:
    ax.set_zlim(z_Min, z_Min + 2 * Range)

# 描画するグラフの設定
ax.plot(x_axis[0], x_axis[1], x_axis[2], label='x', color='#8b0000')
ax.plot(y_axis[0], y_axis[1], y_axis[2], label='y', color='#006400')
ax.plot(z_axis[0], z_axis[1], z_axis[2], label='z', color='#00008b')
ax.plot(x, y, z, marker='o', markersize=3, color='#b8860b')
ax.plot(a_x, a_y, a_z, color='red')
ax.plot(b_x, b_y, b_z, color='green')
ax.plot(c_x, c_y, c_z, color='blue')

ax.set_box_aspect((1, 1, 1))
ax.legend()

plt.show()" ] || error


# 正常な入力を試す3
# txtファイルからモード番号+3 0 0 1 z 0 0 1 x 0 0 1 y 0 0 1 (30 45 90)を縦並びで入力
# モード1(test9)
t_num=9
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input05.txt)
[ "${out}" = "[[1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta1)*sin(theta2) + 1.0*sin(theta3)*cos(theta1)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3) - 1.0*sin(theta2)*cos(theta1)]
 [1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]]" ] || error

# モード2(test10)
t_num=10
out=$( python fkmanipulator/fkmanipulator < test/test_input_text/test_input06.txt)
[ "${out}" = "[[-1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)]
 [1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)]
 [-1.0*sin(theta3)*cos(theta2) 1.0*sin(theta2)
  1.0*cos(theta2)*cos(theta3)]]" ] || error

# モード3(test11)
t_num=11
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input07.txt)
[ "${out}" = "先端の位置ベクトルは: 0Pr =
[[1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta1)*sin(theta2) + 1.0*sin(theta3)*cos(theta1)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3) - 1.0*sin(theta2)*cos(theta1)]
 [1.0*cos(theta2)*cos(theta3) + 1.0*cos(theta2) + 2.0]]
有顔ベクトルは: [a b c] =
[[-1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)]
 [1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)
  1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)]
 [-1.0*sin(theta3)*cos(theta2) 1.0*sin(theta2)
  1.0*cos(theta2)*cos(theta3)]]" ] || error

# モード4(test12)
t_num=12
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input08.txt)
[ "$out" = "#!/usr/bin/python3
import numpy as np
import matplotlib.pyplot as plt


# マニピュレータ再現折れ線グラフの座標
x = [0.0, 0, 0, 0.353553390593274, 1.21957879437771]
y = [0.0, 0, 0, -0.612372435695794, -0.112372435695795]
z = [0.0, 1.00000000000000, 2.00000000000000, 2.70710678118655,
 2.70710678118655]
# 有顔ベクトルの根本と先端の座標
a_x = [1.21957879437771, 0.866025403784439]
a_y = [-0.112372435695795, 0.500000000000000]
a_z = [2.70710678118655, 2.00000000000000]
b_x = [1.21957879437771, 0.866025403784439]
b_y = [-0.112372435695795, 0.500000000000000]
b_z = [2.70710678118655, 3.41421356237309]
c_x = [1.21957879437771, 2.08560419816215]
c_y = [-0.112372435695795, 0.387627564304205]
c_z = [2.70710678118655, 2.70710678118655]


# グラフの表示範囲を決定
# xとyの表示範囲
Max_mat = [max(x), max(y), max(z)]
Max_num = max(Max_mat)
Min_mat = [min(x), min(y), min(z)]
Min_num = min(Min_mat)
Max = np.float16(round(Max_num + 1, 1))
Min = np.float16(round(Min_num - 1, 1))
if abs(Max) > abs(Min):
    Range = abs(Max)
elif abs(Min) > abs(Max):
    Range = abs(Min)
else:
    Range = abs(Max)

# zの表示範囲
z_Max = np.float16(round(max(z)))
z_Min = np.float16(round(min(z)))

# 座標軸表示用
x_axis = np.array([[- Range, Range], [0, 0], [0, 0]])
y_axis = np.array([[0, 0], [- Range, Range], [0, 0]])
z_axis = np.array([[0, 0], [0, 0], [- 2 * Range, 2 * Range]])

# グラフ表示についての設定
fig = plt.figure()
ax = fig.add_subplot(projection='3d')

ax.set_ylim(- Range, Range)
ax.set_xlim(- Range, Range)
if abs(z_Max) > abs(z_Min):
    ax.set_zlim(z_Min, z_Min + 2 * Range)
elif abs(z_Min) > abs(z_Max):
    ax.set_zlim(z_Max - 2 * Range, z_Max)
else:
    ax.set_zlim(z_Min, z_Min + 2 * Range)

# 描画するグラフの設定
ax.plot(x_axis[0], x_axis[1], x_axis[2], label='x', color='#8b0000')
ax.plot(y_axis[0], y_axis[1], y_axis[2], label='y', color='#006400')
ax.plot(z_axis[0], z_axis[1], z_axis[2], label='z', color='#00008b')
ax.plot(x, y, z, marker='o', markersize=3, color='#b8860b')
ax.plot(a_x, a_y, a_z, color='red')
ax.plot(b_x, b_y, b_z, color='green')
ax.plot(c_x, c_y, c_z, color='blue')

ax.set_box_aspect((1, 1, 1))
ax.legend()

plt.show()" ] || error


# 正常な入力を試す4
# モード1(test13)
t_num=13
out=$(echo 1 3 100 100 0 x 0 100 100 y 100 0 100 z 100 100 100 | python fkmanipulator/fkmanipulator)
[ "${out}" = "[[1.0*(-100.0*sin(theta3) + 100.0*cos(theta3))*cos(theta2) + 200.0*sin(theta2) + 100.0*cos(theta2) + 100.0]
 [-1.0*(-(-100.0*sin(theta3) + 100.0*cos(theta3))*sin(theta2) + 100.0*cos(theta2))*sin(theta1) - 1.0*(-100.0*sin(theta2) + 100.0*cos(theta2))*sin(theta1) + 1.0*(100.0*sin(theta3) + 100.0*cos(theta3))*cos(theta1) - 100.0*sin(theta1) + 100.0*cos(theta1) + 100.0]
 [1.0*(-(-100.0*sin(theta3) + 100.0*cos(theta3))*sin(theta2) + 100.0*cos(theta2))*cos(theta1) + 1.0*(-100.0*sin(theta2) + 100.0*cos(theta2))*cos(theta1) + 1.0*(100.0*sin(theta3) + 100.0*cos(theta3))*sin(theta1) + 100.0*sin(theta1) + 100.0*cos(theta1)]]" ] || error

# モード2(test14)
t_num=14
out=$(echo 2 3 100 100 0 x 0 100 100 y 100 0 100 z 100 100 100 | python fkmanipulator/fkmanipulator)
[ "${out}" = "[[1.0*cos(theta2)*cos(theta3) -1.0*sin(theta3)*cos(theta2)
  1.0*sin(theta2)]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)]]" ] || error

# モード3(test15)
t_num=15
out=$(echo 3 3 100 100 0 x 0 100 100 y 100 0 100 z 100 100 100 | python fkmanipulator/fkmanipulator)
[ "${out}" = "先端の位置ベクトルは: 0Pr =
[[1.0*(-100.0*sin(theta3) + 100.0*cos(theta3))*cos(theta2) + 200.0*sin(theta2) + 100.0*cos(theta2) + 100.0]
 [-1.0*(-(-100.0*sin(theta3) + 100.0*cos(theta3))*sin(theta2) + 100.0*cos(theta2))*sin(theta1) - 1.0*(-100.0*sin(theta2) + 100.0*cos(theta2))*sin(theta1) + 1.0*(100.0*sin(theta3) + 100.0*cos(theta3))*cos(theta1) - 100.0*sin(theta1) + 100.0*cos(theta1) + 100.0]
 [1.0*(-(-100.0*sin(theta3) + 100.0*cos(theta3))*sin(theta2) + 100.0*cos(theta2))*cos(theta1) + 1.0*(-100.0*sin(theta2) + 100.0*cos(theta2))*cos(theta1) + 1.0*(100.0*sin(theta3) + 100.0*cos(theta3))*sin(theta1) + 100.0*sin(theta1) + 100.0*cos(theta1)]]
有顔ベクトルは: [a b c] =
[[1.0*cos(theta2)*cos(theta3) -1.0*sin(theta3)*cos(theta2)
  1.0*sin(theta2)]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)]]" ] || error

# モード4(test16)
t_num=16
out=$(echo 4 3 100 100 0 x 0 100 100 y 100 0 100 z 100 100 100 -330 -315 -270 | python fkmanipulator/fkmanipulator)
[ "$out" = "#!/usr/bin/python3
import numpy as np
import matplotlib.pyplot as plt


# マニピュレータ再現折れ線グラフの座標
x = [0.0, 100.000000000000, 100.000000000000, 241.421356237310,
 241.421356237310]
y = [0.0, 100.000000000000, 136.602540378444, 136.602540378444,
 152.494402638233]
z = [0.0, 0, 136.602540378444, 136.602540378444, 309.077027517603]
# 有顔ベクトルの根本と先端の座標
a_x = [241.421356237310, 241.421356237310]
a_y = [152.494402638233, 153.360428042017]
a_z = [309.077027517603, 309.577027517603]
b_x = [241.421356237310, 240.714249456123]
b_y = [152.494402638233, 152.140849247640]
b_z = [309.077027517603, 309.689399953299]
c_x = [241.421356237310, 242.128463018496]
c_y = [152.494402638233, 152.140849247640]
c_z = [309.077027517603, 309.689399953299]


# グラフの表示範囲を決定
# xとyの表示範囲
Max_mat = [max(x), max(y), max(z)]
Max_num = max(Max_mat)
Min_mat = [min(x), min(y), min(z)]
Min_num = min(Min_mat)
Max = np.float16(round(Max_num + 1, 1))
Min = np.float16(round(Min_num - 1, 1))
if abs(Max) > abs(Min):
    Range = abs(Max)
elif abs(Min) > abs(Max):
    Range = abs(Min)
else:
    Range = abs(Max)

# zの表示範囲
z_Max = np.float16(round(max(z)))
z_Min = np.float16(round(min(z)))

# 座標軸表示用
x_axis = np.array([[- Range, Range], [0, 0], [0, 0]])
y_axis = np.array([[0, 0], [- Range, Range], [0, 0]])
z_axis = np.array([[0, 0], [0, 0], [- 2 * Range, 2 * Range]])

# グラフ表示についての設定
fig = plt.figure()
ax = fig.add_subplot(projection='3d')

ax.set_ylim(- Range, Range)
ax.set_xlim(- Range, Range)
if abs(z_Max) > abs(z_Min):
    ax.set_zlim(z_Min, z_Min + 2 * Range)
elif abs(z_Min) > abs(z_Max):
    ax.set_zlim(z_Max - 2 * Range, z_Max)
else:
    ax.set_zlim(z_Min, z_Min + 2 * Range)

# 描画するグラフの設定
ax.plot(x_axis[0], x_axis[1], x_axis[2], label='x', color='#8b0000')
ax.plot(y_axis[0], y_axis[1], y_axis[2], label='y', color='#006400')
ax.plot(z_axis[0], z_axis[1], z_axis[2], label='z', color='#00008b')
ax.plot(x, y, z, marker='o', markersize=3, color='#b8860b')
ax.plot(a_x, a_y, a_z, color='red')
ax.plot(b_x, b_y, b_z, color='green')
ax.plot(c_x, c_y, c_z, color='blue')

ax.set_box_aspect((1, 1, 1))
ax.legend()

plt.show()" ] || error


# 正常な入力を試す5
# モード1(test17)
t_num=17
out=$(echo 1 3 -100 -100 0 x 0 -100 -100 y -100 0 -100 z -100 -100 -100 | python fkmanipulator/fkmanipulator)
[ "${out}" = "[[1.0*(100.0*sin(theta3) - 100.0*cos(theta3))*cos(theta2) - 200.0*sin(theta2) - 100.0*cos(theta2) - 100.0]
 [-1.0*(-(100.0*sin(theta3) - 100.0*cos(theta3))*sin(theta2) - 100.0*cos(theta2))*sin(theta1) - 1.0*(100.0*sin(theta2) - 100.0*cos(theta2))*sin(theta1) + 1.0*(-100.0*sin(theta3) - 100.0*cos(theta3))*cos(theta1) + 100.0*sin(theta1) - 100.0*cos(theta1) - 100.0]
 [1.0*(-(100.0*sin(theta3) - 100.0*cos(theta3))*sin(theta2) - 100.0*cos(theta2))*cos(theta1) + 1.0*(100.0*sin(theta2) - 100.0*cos(theta2))*cos(theta1) + 1.0*(-100.0*sin(theta3) - 100.0*cos(theta3))*sin(theta1) - 100.0*sin(theta1) - 100.0*cos(theta1)]]" ] || error

# モード2(test18)
t_num=18
out=$(echo 2 3 -100 -100 0 x 0 -100 -100 y -100 0 -100 z -100 -100 -100 | python fkmanipulator/fkmanipulator)
[ "${out}" = "[[1.0*cos(theta2)*cos(theta3) -1.0*sin(theta3)*cos(theta2)
  1.0*sin(theta2)]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)]]" ] || error

# モード3(test19)
t_num=19
out=$(echo 3 3 -100 -100 0 x 0 -100 -100 y -100 0 -100 z -100 -100 -100 | python fkmanipulator/fkmanipulator)
[ "${out}" = "先端の位置ベクトルは: 0Pr =
[[1.0*(100.0*sin(theta3) - 100.0*cos(theta3))*cos(theta2) - 200.0*sin(theta2) - 100.0*cos(theta2) - 100.0]
 [-1.0*(-(100.0*sin(theta3) - 100.0*cos(theta3))*sin(theta2) - 100.0*cos(theta2))*sin(theta1) - 1.0*(100.0*sin(theta2) - 100.0*cos(theta2))*sin(theta1) + 1.0*(-100.0*sin(theta3) - 100.0*cos(theta3))*cos(theta1) + 100.0*sin(theta1) - 100.0*cos(theta1) - 100.0]
 [1.0*(-(100.0*sin(theta3) - 100.0*cos(theta3))*sin(theta2) - 100.0*cos(theta2))*cos(theta1) + 1.0*(100.0*sin(theta2) - 100.0*cos(theta2))*cos(theta1) + 1.0*(-100.0*sin(theta3) - 100.0*cos(theta3))*sin(theta1) - 100.0*sin(theta1) - 100.0*cos(theta1)]]
有顔ベクトルは: [a b c] =
[[1.0*cos(theta2)*cos(theta3) -1.0*sin(theta3)*cos(theta2)
  1.0*sin(theta2)]
 [1.0*sin(theta1)*sin(theta2)*cos(theta3) + 1.0*sin(theta3)*cos(theta1)
  -1.0*sin(theta1)*sin(theta2)*sin(theta3) + 1.0*cos(theta1)*cos(theta3)
  -1.0*sin(theta1)*cos(theta2)]
 [1.0*sin(theta1)*sin(theta3) - 1.0*sin(theta2)*cos(theta1)*cos(theta3)
  1.0*sin(theta1)*cos(theta3) + 1.0*sin(theta2)*sin(theta3)*cos(theta1)
  1.0*cos(theta1)*cos(theta2)]]" ] || error

# モード4(test20)
t_num=20
out=$(echo 4 3 -100 -100 0 x 0 -100 -100 y -100 0 -100 z -100 -100 -100 -690 -675 -630 | python fkmanipulator/fkmanipulator)
[ "$out" = "#!/usr/bin/python3
import numpy as np
import matplotlib.pyplot as plt


# マニピュレータ再現折れ線グラフの座標
x = [0.0, -100.000000000000, -100.000000000000, -241.421356237310,
 -241.421356237309]
y = [0.0, -100.000000000000, -136.602540378444, -136.602540378444,
 -152.494402638233]
z = [0.0, 0, -136.602540378444, -136.602540378444, -309.077027517603]
# 有顔ベクトルの根本と先端の座標
a_x = [-241.421356237309, -241.421356237309]
a_y = [-152.494402638233, -151.628377234448]
a_z = [-309.077027517603, -308.577027517603]
b_x = [-241.421356237309, -242.128463018496]
b_y = [-152.494402638233, -152.847956028826]
b_z = [-309.077027517603, -308.464655081907]
c_x = [-241.421356237309, -240.714249456123]
c_y = [-152.494402638233, -152.847956028826]
c_z = [-309.077027517603, -308.464655081907]


# グラフの表示範囲を決定
# xとyの表示範囲
Max_mat = [max(x), max(y), max(z)]
Max_num = max(Max_mat)
Min_mat = [min(x), min(y), min(z)]
Min_num = min(Min_mat)
Max = np.float16(round(Max_num + 1, 1))
Min = np.float16(round(Min_num - 1, 1))
if abs(Max) > abs(Min):
    Range = abs(Max)
elif abs(Min) > abs(Max):
    Range = abs(Min)
else:
    Range = abs(Max)

# zの表示範囲
z_Max = np.float16(round(max(z)))
z_Min = np.float16(round(min(z)))

# 座標軸表示用
x_axis = np.array([[- Range, Range], [0, 0], [0, 0]])
y_axis = np.array([[0, 0], [- Range, Range], [0, 0]])
z_axis = np.array([[0, 0], [0, 0], [- 2 * Range, 2 * Range]])

# グラフ表示についての設定
fig = plt.figure()
ax = fig.add_subplot(projection='3d')

ax.set_ylim(- Range, Range)
ax.set_xlim(- Range, Range)
if abs(z_Max) > abs(z_Min):
    ax.set_zlim(z_Min, z_Min + 2 * Range)
elif abs(z_Min) > abs(z_Max):
    ax.set_zlim(z_Max - 2 * Range, z_Max)
else:
    ax.set_zlim(z_Min, z_Min + 2 * Range)

# 描画するグラフの設定
ax.plot(x_axis[0], x_axis[1], x_axis[2], label='x', color='#8b0000')
ax.plot(y_axis[0], y_axis[1], y_axis[2], label='y', color='#006400')
ax.plot(z_axis[0], z_axis[1], z_axis[2], label='z', color='#00008b')
ax.plot(x, y, z, marker='o', markersize=3, color='#b8860b')
ax.plot(a_x, a_y, a_z, color='red')
ax.plot(b_x, b_y, b_z, color='green')
ax.plot(c_x, c_y, c_z, color='blue')

ax.set_box_aspect((1, 1, 1))
ax.legend()

plt.show()" ] || error


# 正常な入力を試す6
# モード1(test21)
t_num=21
out=$(echo 1 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "${out}" = "[[1.00000000000000]
 [0]
 [0]]" ] || error

 # モード2(test22)
t_num=22
out=$(echo 2 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "${out}" = "[[1.00000000000000 0 0]
 [0 1.00000000000000 0]
 [0 0 1.00000000000000]]" ] || error

 # モード3(test23)
t_num=23
out=$(echo 3 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "${out}" = "先端の位置ベクトルは: 0Pr =
[[1.00000000000000]
 [0]
 [0]]
有顔ベクトルは: [a b c] =
[[1.00000000000000 0 0]
 [0 1.00000000000000 0]
 [0 0 1.00000000000000]]" ] || error

# モード4
t_num=24
out=$(echo 4 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$out" = "#!/usr/bin/python3
import numpy as np
import matplotlib.pyplot as plt


# マニピュレータ再現折れ線グラフの座標
x = [0.0, 1.00000000000000]
y = [0.0, 0]
z = [0.0, 0]
# 有顔ベクトルの根本と先端の座標
a_x = [1.00000000000000, 2.00000000000000]
a_y = [0, 0]
a_z = [0, 0]
b_x = [1.00000000000000, 1.00000000000000]
b_y = [0, 1.00000000000000]
b_z = [0, 0]
c_x = [1.00000000000000, 1.00000000000000]
c_y = [0, 0]
c_z = [0, 1.00000000000000]


# グラフの表示範囲を決定
# xとyの表示範囲
Max_mat = [max(x), max(y), max(z)]
Max_num = max(Max_mat)
Min_mat = [min(x), min(y), min(z)]
Min_num = min(Min_mat)
Max = np.float16(round(Max_num + 1, 1))
Min = np.float16(round(Min_num - 1, 1))
if abs(Max) > abs(Min):
    Range = abs(Max)
elif abs(Min) > abs(Max):
    Range = abs(Min)
else:
    Range = abs(Max)

# zの表示範囲
z_Max = np.float16(round(max(z)))
z_Min = np.float16(round(min(z)))

# 座標軸表示用
x_axis = np.array([[- Range, Range], [0, 0], [0, 0]])
y_axis = np.array([[0, 0], [- Range, Range], [0, 0]])
z_axis = np.array([[0, 0], [0, 0], [- 2 * Range, 2 * Range]])

# グラフ表示についての設定
fig = plt.figure()
ax = fig.add_subplot(projection='3d')

ax.set_ylim(- Range, Range)
ax.set_xlim(- Range, Range)
if abs(z_Max) > abs(z_Min):
    ax.set_zlim(z_Min, z_Min + 2 * Range)
elif abs(z_Min) > abs(z_Max):
    ax.set_zlim(z_Max - 2 * Range, z_Max)
else:
    ax.set_zlim(z_Min, z_Min + 2 * Range)

# 描画するグラフの設定
ax.plot(x_axis[0], x_axis[1], x_axis[2], label='x', color='#8b0000')
ax.plot(y_axis[0], y_axis[1], y_axis[2], label='y', color='#006400')
ax.plot(z_axis[0], z_axis[1], z_axis[2], label='z', color='#00008b')
ax.plot(x, y, z, marker='o', markersize=3, color='#b8860b')
ax.plot(a_x, a_y, a_z, color='red')
ax.plot(b_x, b_y, b_z, color='green')
ax.plot(c_x, c_y, c_z, color='blue')

ax.set_box_aspect((1, 1, 1))
ax.legend()

plt.show()" ] || error


# 異常な入力を試す
# モードの入力について
# 1,2,3,4以外の数字を入力1(test25)
t_num=25
out=$(echo 0 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "${out}" = "" ] || error

# 1,2,3,4以外の数字を入力2(test26)
t_num=26
out=$(echo 0.1 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 1,2,3,4以外の数字を入力3(test27)
t_num=27
out=$(echo -1 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "${out}" = "" ] || error

# 1,2,3,4以外の数字を入力4(test28)
t_num=28
out=$(echo 100000000000000000000000000000000 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "${out}" = "" ] || error

# 文字を入力1(test29)
t_num=29
out=$(echo a 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力2(test30)
t_num=30
out=$(echo A 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力3(test31)
t_num=31
out=$(echo cd 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力4(test32)
t_num=32
out=$(echo あ 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力5(test33)
t_num=33
out=$(echo ｱ 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力6(test34)
t_num=34
out=$(echo 亜 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力7(test35)
t_num=35
out=$(echo θ 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力8(test36)
t_num=36
out=$(echo å 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力9(test37)
t_num=37
out=$(echo 縺 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力1(test38)
t_num=38
out=$(echo [ 0 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力2(test39)
t_num=39
out=$(echo ［ 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力3(test40)
t_num=40
out=$(echo + 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力4(test41)
t_num=41
out=$(echo = 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力1(test42)
# ord('a')を入力
t_num=42
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input09.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力2(test43)
# print("hoge")を入力
t_num=43
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input10.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力3(test44)
t_num=44
out=$(echo mode=1 0 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 何も入力しない(test45)
t_num=45
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input11.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error


# 自由度の入力について
# 負の値の入力(test46)
t_num=46
out=$(echo 1 -1 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力1(test47)
t_num=47
out=$(echo 1 a 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力2(test48)
t_num=48
out=$(echo 1 A 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力3(test49)
t_num=49
out=$(echo 1 cd 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力4(test50)
t_num=50
out=$(echo 1 あ 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力5(test51)
t_num=51
out=$(echo 1 ｱ 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力6(test52)
t_num=52
out=$(echo 1 亜 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力7(test53)
t_num=53
out=$(echo 1 θ 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力8(test54)
t_num=54
out=$(echo 1 å 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力9(test55)
t_num=55
out=$(echo 1 縺 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力1(test56)
t_num=56
out=$(echo 1 [ 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力2(test57)
t_num=57
out=$(echo 1 ［ 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力3(test58)
t_num=58
out=$(echo 1 + 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力4(test59)
t_num=59
out=$(echo 1 = 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力1(test60)
# ord('a')を入力
t_num=60
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input12.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力2(test61)
# print("hoge")を入力
t_num=61
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input13.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力3(test62)
t_num=62
out=$(echo 1 mode=1 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 何も入力しない(test63)
t_num=63
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input14.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error


# 位置ベクトルの入力について
# x成分
# 文字を入力1(test64)
t_num=64
out=$(echo 1 1 a 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力2(test65)
t_num=65
out=$(echo 1 1 A 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力3(test66)
t_num=66
out=$(echo 1 1 cd 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力4(test67)
t_num=67
out=$(echo 1 1 あ 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力5(test68)
t_num=68
out=$(echo 1 1 ｱ 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力6(test69)
t_num=69
out=$(echo 1 1 亜 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力7(test70)
t_num=70
out=$(echo 1 1 θ 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力8(test71)
t_num=71
out=$(echo 1 1 å 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力9(test72)
t_num=72
out=$(echo 1 1 縺 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力1(test73)
t_num=73
out=$(echo 1 1 [ 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力2(test74)
t_num=74
out=$(echo 1 1 ［ 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力3(test75)
t_num=75
out=$(echo 1 1 + 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力4(test76)
t_num=76
out=$(echo 1 1 = 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力1(test77)
# ord('a')を入力
t_num=77
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input15.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力2(test78)
# print("hoge")を入力
t_num=78
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input16.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力3(test79)
t_num=79
out=$(echo 1 1 mode=1 0 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 何も入力しない(test80)
t_num=80
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input17.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# y成分
# 文字を入力1(test81)
t_num=81
out=$(echo 1 1 0 a 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力2(test82)
t_num=82
out=$(echo 1 1 0 A 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力3(test83)
t_num=83
out=$(echo 1 1 0 cd 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力4(test84)
t_num=84
out=$(echo 1 1 0 あ 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力5(test85)
t_num=85
out=$(echo 1 1 0 ｱ 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力6(test86)
t_num=86
out=$(echo 1 1 0 亜 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力7(test87)
t_num=87
out=$(echo 1 1 0 θ 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力8(test88)
t_num=88
out=$(echo 1 1 0 å 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力9(test89)
t_num=89
out=$(echo 1 1 0 縺 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力1(test90)
t_num=90
out=$(echo 1 1 0 [ 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力2(test91)
t_num=91
out=$(echo 1 1 0 ［ 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力3(test92)
t_num=92
out=$(echo 1 1 0 + 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力4(test93)
t_num=93
out=$(echo 1 1 0 = 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力1(test94)
# ord('a')を入力
t_num=94
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input18.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力2(test95)
# print("hoge")を入力
t_num=95
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input19.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力3(test96)
t_num=96
out=$(echo 1 1 0 mode=1 0 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 何も入力しない(test97)
t_num=97
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input20.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# z成分
# 文字を入力1(test98)
t_num=98
out=$(echo 1 1 0 0 a x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力2(test99)
t_num=99
out=$(echo 1 1 0 0 A x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力3(test100)
t_num=100
out=$(echo 1 1 0 0 cd x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力4(test101)
t_num=101
out=$(echo 1 1 0 0 あ x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力5(test102)
t_num=102
out=$(echo 1 1 0 0 ｱ x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力6(test103)
t_num=103
out=$(echo 1 1 0 0 亜 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力7(test104)
t_num=104
out=$(echo 1 1 0 0 θ x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力8(test105)
t_num=105
out=$(echo 1 1 0 0 å x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力9(test106)
t_num=106
out=$(echo 1 1 0 0 縺 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力1(test107)
t_num=107
out=$(echo 1 1 0 0 [ x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力2(test108)
t_num=108
out=$(echo 1 1 0 0 ［ x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力3(test109)
t_num=109
out=$(echo 1 1 0 0 + x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力4(test110)
t_num=110
out=$(echo 1 1 0 0 = x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力1(test111)
# ord('a')を入力
t_num=111
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input21.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力2(test112)
# print("hoge")を入力
t_num=112
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input22.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力3(test113)
t_num=113
out=$(echo 1 1 0 0 mode=1 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 何も入力しない(test114)
t_num=114
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input23.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error


# 回転軸ベクトルの向きの入力について
# x,y,z以外の文字の入力1(test115)
t_num=115
out=$(echo 1 1 0 0 0 a 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# x,y,z以外の文字の入力2(test116)
t_num=116
out=$(echo 1 1 0 0 0 A 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# x,y,z以外の文字の入力3(test117)
t_num=117
out=$(echo 1 1 0 0 0 cd 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# x,y,z以外の文字の入力4(test118)
t_num=118
out=$(echo 1 1 0 0 0 あ 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# x,y,z以外の文字の入力5(test119)
t_num=119
out=$(echo 1 1 0 0 0 ｱ 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# x,y,z以外の文字の入力6(test120)
t_num=120
out=$(echo 1 1 0 0 0 亜 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# x,y,z以外の文字の入力7(test121)
t_num=121
out=$(echo 1 1 0 0 0 θ 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# x,y,z以外の文字の入力8(test122)
t_num=122
out=$(echo 1 1 0 0 0 å 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# x,y,z以外の文字の入力9(test123)
t_num=123
out=$(echo 1 1 0 0 0 縺 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 数字を入力1(test124)
t_num=124
out=$(echo 1 1 0 0 0 1 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 数字を入力2(test125)
t_num=125
out=$(echo 1 1 0 0 0 0.1 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 数字を入力3(test126)
t_num=126
out=$(echo 1 1 0 0 0 -1 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力4(test127)
t_num=127
out=$(echo 1 1 0 0 0 -0.1 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 数字を入力5(test128)
t_num=128
out=$(echo 1 1 0 0 0 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力1(test129)
t_num=129
out=$(echo 1 1 0 0 0 [ 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力2(test130)
t_num=130
out=$(echo 1 1 0 0 0 ［ 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力3(test131)
t_num=131
out=$(echo 1 1 0 0 0 + 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力4(test132)
t_num=132
out=$(echo 1 1 0 0 0 = 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力1(test133)
# chr(120)を入力
t_num=133
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input24.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力2(test134)
# print("hoge")を入力
t_num=134
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input25.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力3(test135)
t_num=135
out=$(echo 1 1 0 0 mode=1 x 1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 何も入力しない(test136)
t_num=136
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input26.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error


# 手先の位置ベクトルの入力について
# x成分
# 文字を入力1(test137)
t_num=137
out=$(echo 1 0 a 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力2(test138)
t_num=138
out=$(echo 1 0 A 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力3(test139)
t_num=139
out=$(echo 1 0 cd 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力4(test140)
t_num=140
out=$(echo 1 0 あ 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力5(test141)
t_num=141
out=$(echo 1 0 ｱ 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力6(test142)
t_num=142
out=$(echo 1 0 亜 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力7(test143)
t_num=143
out=$(echo 1 0 θ 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力8(test144)
t_num=144
out=$(echo 1 0 å 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力9(test145)
t_num=145
out=$(echo 1 0 縺 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力1(test146)
t_num=146
out=$(echo 1 0 [ 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力2(test147)
t_num=147
out=$(echo 1 0 ［ 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力3(test148)
t_num=148
out=$(echo 1 0 + 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力4(test149)
t_num=149
out=$(echo 1 0 = 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力1(test150)
# ord('a')を入力
t_num=150
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input27.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力2(test151)
# print("hoge")を入力
t_num=151
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input28.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力3(test152)
t_num=152
out=$(echo 1 0 mode=1 0 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 何も入力しない(test153)
t_num=153
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input29.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# y成分
# 文字を入力1(test154)
t_num=154
out=$(echo 1 0 0 a 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力2(test155)
t_num=155
out=$(echo 1 0 0 A 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力3(test156)
t_num=156
out=$(echo 1 0 0 cd 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力4(test157)
t_num=157
out=$(echo 1 0 0 あ 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力5(test158)
t_num=158
out=$(echo 1 0 0 ｱ 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力6(test159)
t_num=159
out=$(echo 1 0 0 亜 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力7(test160)
t_num=160
out=$(echo 1 0 0 θ 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力8(test161)
t_num=161
out=$(echo 1 0 0 å 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力9(test162)
t_num=162
out=$(echo 1 0 0 縺 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力1(test163)
t_num=163
out=$(echo 1 0 0 [ 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力2(test164)
t_num=164
out=$(echo 1 0 0 ［ 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力3(test165)
t_num=165
out=$(echo 1 0 0 + 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力4(test166)
t_num=166
out=$(echo 1 0 0 = 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力1(test167)
# ord('a')を入力
t_num=167
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input30.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力2(test168)
# print("hoge")を入力
t_num=168
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input31.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力3(test169)
t_num=169
out=$(echo 1 0 0 mode=1 0 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 何も入力しない(test170)
t_num=170
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input32.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# z成分
# 文字を入力1(test171)
t_num=171
out=$(echo 1 0 0 0 a | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力2(test172)
t_num=172
out=$(echo 1 0 0 0 A | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力3(test173)
t_num=173
out=$(echo 1 0 0 0 cd | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力4(test174)
t_num=174
out=$(echo 1 0 0 0 あ | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力5(test175)
t_num=175
out=$(echo 1 0 0 0 ｱ | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力6(test176)
t_num=176
out=$(echo 1 0 0 0 亜 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力7(test177)
t_num=177
out=$(echo 1 0 0 0 θ | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力8(test178)
t_num=178
out=$(echo 1 0 0 0 å | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力9(test179)
t_num=179
out=$(echo 1 0 0 0 縺 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力1(test180)
t_num=180
out=$(echo 1 0 0 0 [ | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力2(test181)
t_num=181
out=$(echo 1 0 0 0 ［ | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力3(test182)
t_num=182
out=$(echo 1 0 0 0 + | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力4(test183)
t_num=183
out=$(echo 1 0 0 0 = | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力1(test184)
# ord('a')を入力
t_num=184
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input33.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力2(test185)
# print("hoge")を入力
t_num=185
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input34.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力3(test186)
t_num=186
out=$(echo 1 0 0 0 mode=1 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 何も入力しない(test187)
t_num=187
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input35.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error


# モード4の角度の入力について
# 文字を入力1(test188)
t_num=188
out=$(echo 4 1 0 0 0 x 1 0 0 a | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力2(test189)
t_num=189
out=$(echo 4 1 0 0 0 x 1 0 0 A | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力3(test180)
t_num=190
out=$(echo 4 1 0 0 0 x 1 0 0 cd | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力4(test181)
t_num=191
out=$(echo 4 1 0 0 0 x 1 0 0 あ | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力5(test182)
t_num=192
out=$(echo 4 1 0 0 0 x 1 0 0 ｱ | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力6(test183)
t_num=193
out=$(echo 4 1 0 0 0 x 1 0 0 亜 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力7(test184)
t_num=194
out=$(echo 4 1 0 0 0 x 1 0 0 θ | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力8(test185)
t_num=195
out=$(echo 4 1 0 0 0 x 1 0 0 å | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字を入力9(test186)
t_num=196
out=$(echo 4 1 0 0 0 x 1 0 0 縺 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力1(test187)
t_num=197
out=$(echo 4 1 0 0 0 x 1 0 0 [ | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力2(test188)
t_num=198
out=$(echo 4 1 0 0 0 x 1 0 0 ［ | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力3(test189)
t_num=199
out=$(echo 4 1 0 0 0 x 1 0 0 + | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 記号を入力4(test200)
t_num=200
out=$(echo 4 1 0 0 0 x 1 0 0 = | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力1(test201)
# ord('a')を入力
t_num=201
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input36.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力2(test202)
# print("hoge")を入力
t_num=202
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input37.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 文字と記号と数字の混合の入力3(test203)
t_num=203
out=$(echo 4 1 0 0 0 x 1 0 0 mode=1 | python fkmanipulator/fkmanipulator)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error

# 何も入力しない(test204)
t_num=204
out=$(python fkmanipulator/fkmanipulator < test/test_input_text/test_input38.txt)
[ "$?" = 1 ] || error
[ "${out}" = "" ] || error


# エラーがなければOKを表示
[ "$res" = 0 ] && echo OK

exit $res # 終了ステータスを返して終了
