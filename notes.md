Code Interactions

X- CLI welcomes to gem + auto-scrapes data (see below)
X- Scraper scrapes website of Top 50 (http://www.imdb.com/search/name?gender=male,female&ref_=rlm) and creates Celeb objects
X- Celeb Object = Rank + Name + URL
X- Celeb Class tracks all Celeb Objects created (@@all)
X- Celeb @@all used to track ordered list (1-50) -- Note : Should be in order as entered but use Rank if needed

- CLI auto-lists top 10 with options to "list" (again), "exit" (program), "#" (select one of the celebs for further details), "More" (see range of 1-50 in increments of 10) -- Note : Possible to select unlisted celeb or not?
  -> If "list" after "More" -- will list the current range of celebs
- List Celebs using format of : "{#}. {Name}"

- Scraper scrapes website of individual Celeb and creates Film objects + updates Celeb Films Array
- Film Object = Name + Year + Role (if possible, kind of weird formatting there)

- More Details format of :
  "{#}. {Name}" <- Celeb Object
  "{Year (descending order)} - {# films was in that year}" <- Celeb Object using Films Array (collect films with year X and get size of returned array)
  etc.
  - CLI list options of "new" (select new celeb), "exit" (program), "year #" (see films that person was in that year), "max" (show information ordered by # of films in year descending), "min" (show information ordered by # of films in year ascending)

- Exit Program

-------
Referenced Labs

oo-student-scraper-v-000
ruby-objects-has-many-through-lab-v-000
ttt-with-ai-project-v-000
ruby-advanced-class-methods-lab-v-000
