LENGTH = 20

@arr = Array.new(LENGTH)  { Array.new(LENGTH) {' '}}

@arr_temp = Marshal.load(Marshal.dump(@arr))

#Отрисовка поля с точками
def show(arr)
  puts "\e[H\e[2J"
  arr.each_index do |i|
    arr[i].each_index do |j|
      print arr[i][j], ' '
    end
    puts
  end
end

#Подсчет оставшихся на поле точек
def count
  summ=0
  @arr.each_index do |i|
    @arr[i].each_index do |j|
      if @arr[i][j] == '*'
        summ+=1
      end
    end
  end

  if summ == 0
    puts "No more points. The end"

    exit
  end
end

#Расчет массива соседних точек
def sosed(i, j)
  @points_arr = Array.new(8)  { Array.new(2) {}}

  k=0

  (i-1).upto(i+1) do |ii|
    (j-1).upto(j+1) do |jj|
      next if i == ii && j == jj

      @points_arr[k][0] = (ii)

      @points_arr[k][1] = (jj)

      k+= 1
    end
  end
end

#Получение живых соседей
def sosed_count
  sosedi = 0

  @points_arr.each_index do |i|
    ii = @points_arr[i][0]

    jj = @points_arr[i][1]

    next if ii == nil || jj == nil

    next if ii < 0 || jj < 0

    next if ii >= LENGTH || jj >= LENGTH

    sosedi+=1 if @arr[ii][jj] == '*'
  end

  return sosedi
end

#Следующее поколение
def next_gen
  @arr.each_index do |i|
    @arr[i].each_index do |j|
      sosed(i, j)

      sosedi = sosed_count
      if @arr[i][j] == ' ' && sosedi == 3
        @arr_temp[i][j] = '*'
      end

      if @arr[i][j] == '*' && (sosedi <2 || sosedi >3)
        @arr_temp[i][j] = ' '
      end

      if @arr[i][j] == '*' && (sosedi == 2 || sosedi == 3)
        @arr_temp[i][j] = '*'
      end
    end
  end

  @arr = Marshal.load(Marshal.dump(@arr_temp))
end

#Установка фигур
@arr[1][3]='*'

@arr[2][4]='*'

@arr[2][5]='*'

@arr[1][5]='*'

@arr[0][5]='*'

#Основной цикл
loop do
  show(@arr)

  count

  next_gen

  sleep(0.5)
end