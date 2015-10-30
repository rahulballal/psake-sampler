using System.Collections.Generic;
using System.Linq;
using PSakeSampler.Nupkg;
using Xunit;

namespace PSakeSampler.XunitTests
{
    public class MarvelTests
    {
        [Fact]
        public void IronManShouldExist()
        {
            // Arrange
            var marvelHero = new MarvelHero() {IsGood = true, Name = "Iron Man"};
            // Act
            var marvelHeroes = MarvelHeroes.GetHeroes();
            var found = marvelHeroes.Contains(marvelHero);
            // Assert

            Assert.True(found);
        }
    }
}
