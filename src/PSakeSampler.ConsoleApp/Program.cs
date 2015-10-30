using System;
using PSakeSampler.Nupkg;
using PSakeSampler.Nupkg2;

namespace PSakeSampler.ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            var dc = DCHeroes.GetHeroes();
            Console.ForegroundColor = ConsoleColor.Blue;
            foreach (var hero in dc)
            {
                Console.WriteLine("{0} is good ? {1}", hero.Name, hero.IsGood);
            }
            var marvel = MarvelHeroes.GetHeroes();
            Console.ForegroundColor = ConsoleColor.DarkRed;
            foreach (var hero in marvel)
            {
                Console.WriteLine("{0} is good ? {1}", hero.Name, hero.IsGood);
            }

            Console.ReadKey();

        }
    }
}
