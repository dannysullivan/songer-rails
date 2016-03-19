module LyricsFetcher
  def self.pick_lyrics(number_of_syllables)
    lyrics = []
    number_of_syllables.times do
      lyrics << self::COMMON_WORDS.sample
    end
    lyrics
  end

  self::COMMON_WORDS = [
    "the",
    "name",
    "of",
    "to",
    "through",
    "and",
    "just",
    "a",
    "form",
    "in",
    "much",
    "is",
    "great",
    "it",
    "think",
    "you",
    "say",
    "that",
    "help",
    "he",
    "low",
    "was",
    "line",
    "for",
    "on",
    "turn",
    "are",
    "cause",
    "with",
    "same",
    "as",
    "mean",
    "I",
    "his",
    "move",
    "they",
    "right",
    "be",
    "boy",
    "at",
    "old",
    "one",
    "too",
    "have",
    "does",
    "this",
    "tell",
    "from",
    "or",
    "set",
    "had",
    "three",
    "by",
    "want",
    "hot",
    "air",
    "but",
    "well",
    "some",
    "what",
    "play",
    "there",
    "small",
    "we",
    "end",
    "can",
    "put",
    "out",
    "home",
    "read",
    "were",
    "hand",
    "all",
    "port",
    "your",
    "large",
    "when",
    "spell",
    "up",
    "add",
    "use",
    "word",
    "land",
    "how",
    "here",
    "said",
    "must",
    "an",
    "big",
    "each",
    "high",
    "she",
    "such",
    "which",
    "do",
    "act",
    "their",
    "why",
    "time",
    "ask",
    "if",
    "men",
    "will",
    "change",
    "way",
    "went",
    "light",
    "kind",
    "then",
    "off",
    "them",
    "need",
    "would",
    "house",
    "write",
    "like",
    "try",
    "so",
    "us",
    "these",
    "her",
    "long",
    "point",
    "make",
    "thing",
    "world",
    "see",
    "near",
    "him",
    "build",
    "two",
    "self",
    "has",
    "earth",
    "look",
    "more",
    "head",
    "day",
    "stand",
    "could",
    "own",
    "go",
    "page",
    "come",
    "should",
    "did",
    "my",
    "found",
    "sound",
    "no",
    "school",
    "most",
    "grow",
    "who",
    "still",
    "learn",
    "know",
    "plant",
    "than",
    "food",
    "call",
    "sun",
    "first",
    "four",
    "thought",
    "may",
    "let",
    "down",
    "keep",
    "side",
    "eye",
    "been",
    "now",
    "last",
    "find",
    "door",
    "new",
    "work",
    "tree",
    "part",
    "cross",
    "take",
    "since",
    "get",
    "hard",
    "place",
    "start",
    "made",
    "might",
    "live",
    "where",
    "saw",
    "far",
    "back",
    "sea",
    "draw",
    "left",
    "round",
    "late",
    "man",
    "run",
    "year",
    "don't",
    "came",
    "while",
    "show",
    "press",
    "close",
    "good",
    "night",
    "me",
    "real",
    "give",
    "life",
    "our",
    "few",
    "stop"
  ]
end
