int[] cenario1 = { 3, 2, 1, 6, 0, 5 };
int[] cenario2 = { 7, 5, 13, 9, 1, 6, 4 };

int ObterMaiorValorArray(int[] array)
{
    return array.Max(x => x);
}

int ObterPosicaoMaiorValorArray(int[] array)
{
    return Array.IndexOf(array, ObterMaiorValorArray(array));
}

List<int> ObterArrayEsquerdaMaiorValor(int[] array)
{
    var indexMaiorValor = ObterPosicaoMaiorValorArray(array);

    var esquerda = new List<int>();

    var i = 0;

    while (i != indexMaiorValor)
    {
        esquerda.Add(array[i]);

        i++;
    }

    return esquerda.OrderByDescending(x => x).ToList();
}

List<int> ObterArrayDireitaMaiorValor(int[] array)
{
    var indexMaiorValor = ObterPosicaoMaiorValorArray(array);

    var direita = new List<int>();

    while (array.Length - 1 != indexMaiorValor)
    {
        indexMaiorValor++;
        direita.Add(array[indexMaiorValor]);
    }

    return direita.OrderByDescending(x => x).ToList();
}

string TransformarListaEmString(List<int> lista)
{
    var str = "";

    if (lista.Count != 0)
    {
        str += "[" + string.Join(", ", lista) + "]";
    }

    return str;
}

void ObterResultado(int[] array)
{
    Console.WriteLine("Array de entrada: " + TransformarListaEmString(array.ToList()));

    var maiorValor = ObterMaiorValorArray(array).ToString();

    Console.WriteLine("Raiz: " + maiorValor);

    var listaEsquerda = ObterArrayEsquerdaMaiorValor(array);

    Console.WriteLine("Galhos da esquerda: " + TransformarListaEmString(listaEsquerda));

    var listaDireita = ObterArrayDireitaMaiorValor(array);

    Console.WriteLine("Galhos da direita: " + TransformarListaEmString(listaDireita));
}

Console.WriteLine("Cenário 1");
ObterResultado(cenario1);

Console.WriteLine();
Console.WriteLine();

Console.WriteLine("Cenário 2");
ObterResultado(cenario2);
