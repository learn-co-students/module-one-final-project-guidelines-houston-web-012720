class Viewer

@@prompt = TTY::Prompt.new
@@a = Artii::Base.new :font => 'slant'
@@pastel = Pastel.new


def self.header
    system ('clear')
    puts @@pastel.magenta.bold(@@a.asciify("Cora The Chooser"))
end

def self.prompt
    @@prompt
end

end