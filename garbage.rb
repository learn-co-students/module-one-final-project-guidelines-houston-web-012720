  base_rel = 100
  tag_rel = 0
  distance_rel = 1.0
  keyword_rel = 5000

      keywords = ["car", "cat", "cam"]

    # def keyword_relevance

    #     # self.matches.reduce(0) {|memo, match| memo + (match.keyword.relevance * match.count)}
    # end

    # def distance_relevance_multiplier
    #     # 1.0 - ((distance) / 2 * (max_distance))
    #     1.0
    # end

    def relevance(tag_relevance, distance_relevance_multiplier, keywords, keyword_relevance)

      base_rel * (100+tag_rel)/100
      normalized_relevance = (tag_relevance) + (keyword_relevance ** (1.0/keywords.count))
      final_relevance = normalized_relevance * distance_relevance_multiplier
    end

    relevance(tag_rel, distance_rel, keywords, keyword_rel)