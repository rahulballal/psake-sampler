using System;

namespace PSakeSampler.Nupkg
{
    public class MarvelHero:IEquatable<MarvelHero>
    {
        public string Name { get; set; }
        public bool IsGood { get; set; }

        public bool Equals(MarvelHero other)
        {
            return (String.Equals(Name, other.Name, StringComparison.InvariantCultureIgnoreCase)) &&
                   (String.Equals(Name, other.Name, StringComparison.InvariantCultureIgnoreCase));
        }
    }
}