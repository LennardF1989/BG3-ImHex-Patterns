using System.Buffers.Text;
using LSLib.LS;

namespace BG3.Extractor
{
    public static class Program
    {
        public static void Main(string[] args)
        {
            var inputFile = Path.GetFullPath(args[0]);
            var outputFile = args.Length > 1 ? Path.GetFullPath(args[1]) : Path.GetFullPath("NewAge.lsmf");

            using var packageReader = new PackageReader(inputFile);
            var package = packageReader.Read();

            var globalsFileInfo = package.Files.Single(x => x.Name == "Globals.lsf");
            var globalsStream = globalsFileInfo.MakeStream();

            using var lsfReader = new LSFReader(globalsStream);
            var resource = lsfReader.Read();

            var newAgeNode = resource.Regions["NewAge"].Attributes["NewAge"];
            var decodedNewAge = Convert.FromBase64String(newAgeNode.AsString(new NodeSerializationSettings()));

            File.WriteAllBytes(outputFile, decodedNewAge);

            globalsFileInfo.ReleaseStream();
        }
    }
}