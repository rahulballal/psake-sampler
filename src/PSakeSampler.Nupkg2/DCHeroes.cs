using System.Collections.Generic;

namespace PSakeSampler.Nupkg2
{
    public class DCHeroes
    {
        public static IEnumerable<DcHero> GetHeroes()
        {
            return new List<DcHero>
            {
                new DcHero("Superman",true),
                new DcHero("Batman",true),
                new DcHero("Darkseid",false),
                new DcHero("The Flash",true),
                new DcHero("Black Adam",false)
            };
        } 
    }
}