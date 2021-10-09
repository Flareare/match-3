pool = {[1]="A", [2]="B",[3]="C",[4]="D",[5]="E",[6]="F"} --все, что может быть на поле
fieldlen = 10 --длина поля
field = {}    --матрица для самого поля
--unit = 1      

function init()
math.randomseed(os.time())    --рандомное число полученное из системного времени
  for i = 1,fieldlen do
    for j = 1,fieldlen do
      unit = math.random(1,6)
      field[i][j] = pool[unit]
    end
  end
end	

function checkmix()         --проверка на корректное перемешивание
  mixresult = true          --по умолчанию тру
  streak = 0
  for i = 1,fieldlen do
    for j = i,fieldlen-1 do   --идем по диагонали 
      if field[i][j]=filed[i+1][j] --если в строке есть совпадения 
        then streak = streak+1       --увеличиваем стрик
        else streak = streak-1       --если нет - уменьшаем
      end  
      if streak>=3                 --если обнаружился стрик из 3х 
        then mixresult = false       --результат перемешивания неудачный
      end    
    end
    for j = i,fieldlen-1 do
      if field [j][i]=field[j][i+1]
        then streak = streak+1
        else streak = streak-1
      end
      if streak>=3 
        then mixresult = false
      end    
    end
  end  
end

function dump()
  for i = 1,fieldlen do
    for j = 1,fieldlen do
      io.write(field[i][j])
    end
  --io.write("\n")
  end
end

init()
dump()