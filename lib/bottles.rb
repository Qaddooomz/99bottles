class Bottles
    attr_accessor :bottles_count

    def verse(bottles_count)

        @bottles_count = bottles_count - 1
        total_bottles_label = get_bottle_label(bottles_count)
        remaining_bottles_label = get_bottle_label(@bottles_count)

        if (bottles_count == 0)
            return <<-string
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    string
        elsif (bottles_count == 1)
            return <<-string
#{bottles_count} #{total_bottles_label} of beer on the wall, #{bottles_count} #{total_bottles_label} of beer.
Take it down and pass it around, no more bottles of beer on the wall.
            string
        else 
        <<-string
#{bottles_count} #{total_bottles_label} of beer on the wall, #{bottles_count} #{total_bottles_label} of beer.
Take one down and pass it around, #{@bottles_count} #{remaining_bottles_label} of beer on the wall.
        string
        end
    end

    def verses(max_index, min_index)
        
        verses = []
        max_index.downto(min_index) do |index|
            verses << verse(index)
        end
        verses.join("\n")
    end

    def song
        verses(99, 0)
    end

    def get_bottle_label(bottles_count)
        bottles_label = (bottles_count == 1) ? "bottle" : "bottles"
    end
end