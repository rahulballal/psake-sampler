using System.Collections.Generic;

namespace PSakeSampler.Nupkg
{
    public  class MarvelHeroes
    {
        public static IEnumerable<MarvelHero> GetHeroes()
        {
            return new List<MarvelHero>
            {
                new MarvelHero {IsGood = true, Name = "Iron Man"},
                new MarvelHero {IsGood = true, Name = "Incredible Hulk"},
                new MarvelHero {IsGood = true, Name = "Thor"},
                new MarvelHero {IsGood = false, Name = "Ultron"},
                new MarvelHero {IsGood = false, Name = "Thanos"}
            };
        } 
    }
}
