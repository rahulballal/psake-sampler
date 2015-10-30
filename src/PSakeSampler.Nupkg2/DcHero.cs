namespace PSakeSampler.Nupkg2
{
    public class DcHero
    {
        public string Name { get; set; }
        public bool IsGood { get; set; }

        public DcHero(string name, bool good)
        {
            this.Name = name;
            this.IsGood = good;
        }   
    }
}
