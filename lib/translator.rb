# require modules here
require 'yaml'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  # p emoticons 
  # ex: emoticons = { "angel" => ["O:)", "☜(⌒▽⌒)☞"],
  # key "angel" is meaning 
  # value is array of emoticons, first emoticon is English, second is Japanese 
  
  emoticon_hash = { "get_meaning" => {}, "get_emoticon" => {} }
  
  emoticons.each do |meaning, emoticons| 
    emoticon_hash["get_meaning"][emoticons[1]] = meaning
    # gives English meaning for Japanese emoticon
    # "get_meaning" => {"☜(⌒▽⌒)☞"=>"angel",
    emoticon_hash["get_emoticon"][emoticons[0]] = emoticons[1]
    # gives English emoticon for Japanese emoticon
    # "get_emoticon" => {"O:)"=>"☜(⌒▽⌒)☞",
  end 
   p emoticon_hash
   
   emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  # result = load_library(file_path)['get_emoticon'][emoticon]
  # result ? result : "Sorry, that emoticon was not found"
  
  emoticon_hash = load_library(file_path)
  if emoticon_hash["get_emoticon"].include?(emoticon)
    emoticon_hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)
  if emoticon_hash["get_meaning"].include?(emoticon)
    emoticon_hash["get_meaning"][emoticon] 
  else 
    "Sorry, that emoticon was not found"
  end
end