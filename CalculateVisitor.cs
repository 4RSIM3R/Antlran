namespace Dea;

public class CalculateVisitor : MathBaseVisitor<double>
{
    public override double VisitArithmetic(MathParser.ArithmeticContext context)
    {
        var left = Visit(context.left);
        var right = Visit(context.right);

        return context.op.Type switch
        {
            MathLexer.PLUS => left + right,
            MathLexer.MINUS => left - right,
            MathLexer.STAR => left * right,
            MathLexer.SLASH => left / right,
            _ => 0
        };
    }

    public override double VisitParen(MathParser.ParenContext context)
    {
        return Visit(context.expr());
    }

    public override double VisitConstant(MathParser.ConstantContext context)
    {
        if (context.INT() != null)
        {
            return Convert.ToInt64(context.INT().GetText());
        }

        if (context.DOUBLE() != null)
        {
            return Convert.ToDouble(context.INT().GetText());
        }

        return 0;
    }
}