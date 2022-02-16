# Log parser method
def parser(action,list)
    puts 

    case action
    when  1
        sortedList = list.sort_by   { |key,value| -value.uniq.length }
        sortedList.each do |key,value|
            puts "#{key} #{value.uniq.count}"
        end
    when  2
        sortedList = list.sort_by   { |key,value| value.uniq.length }
        sortedList.each do |key,value|
            puts "#{key} #{value.uniq.count}"
        end
    when 3
        sortedList = list.sort_by { |key, value| value.length }
        sortedList.each do |key,value|
            puts "#{key} #{value.count}"
        end
    when 4
        sortedList = list.sort_by { |key, value| -value.length }
        sortedList.each do |key,value|
            puts " #{key} #{value.count}"
        end
    when 5
        puts "Goodbye"
    else 
        puts "Please put correct option"
    end

    puts 
end


# Reads weblog file and saves to memory
if ARGV.length < 1 
    puts "You forgot to pass the file name as a parameter"
    return
end

filename = ARGV[0]
ARGV.clear 

newWebserverList = {}

File.foreach(filename) { |line|
    splitLine = line.split(" ")
    ip = splitLine[1]
    url = splitLine[0]
    if newWebserverList.key?(url)
        newWebserverList[url] << ip 
    else 
        newWebserverList[url] = [ip]
    end
}


# User menu
userInput = 0

while userInput != 5 do 
    puts "Welcome to the Smart Pension weblog! What do you want to do today?"
    puts "1 - List of webpages with most unique page visits in descending order"
    puts "2 - List of webpages with most unique page visits in ascending order"
    puts "3 - List of webpages with most page visits in ascending order"
    puts "4 - List of webpages with most page visits in descending order"
    puts "5 - Exit"
    puts "Please type 1, 2, 3, 4 or 5"
    userInput = gets.chomp.to_i
    
    parser(userInput,newWebserverList)
end