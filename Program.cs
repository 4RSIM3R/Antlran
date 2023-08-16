using Antlr4.Runtime;
using Dea;

public class Program
{
    public static void Main(String[] args)
    {
        var payload = "5 + 5";
        var inputStream = new AntlrInputStream(payload);
        var lexer = new MathLexer(inputStream);
        var tokenStream = new CommonTokenStream(lexer);
        var parser = new MathParser(tokenStream);

        var visitor = new CalculateVisitor();

        var result = visitor.Visit(parser.expr());
        
        Console.WriteLine(result);

    }
}