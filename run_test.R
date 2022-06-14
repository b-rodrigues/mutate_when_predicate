df <- readr::read_csv("https://raw.githubusercontent.com/b-rodrigues/mutate_when_predicate/main/example_df.csv")

ids <- df %>%
  group_by(person, col_a, col_c) %>%
  summarise(needs_correction = n_distinct(to_fill)) %>%
  filter(needs_correction > 1) %>%
  mutate(needs_correction = TRUE)

full_join(df, ids) %>%  
  group_by(person, col_a, col_c) %>%
  mutate(new_loc = ifelse(all(needs_correction),
                            pull(
                              filter(cur_data(),
                                     col_b == "W"),
                              to_fill),
                          NA_character_)) %>% 
  ungroup() %>%  
  mutate(new_loc2 = coalesce(new_loc, to_fill)) %>% view 
