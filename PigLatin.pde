public void setup() 
{
  String[] lines = loadStrings("words.txt");
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i++) 
  {
    System.out.println(pigLatin(lines[i]));
  }
}
public void draw()
{
  //not used
}
public int findFirstVowel(String sWord)
  //precondition: sWord is a valid String of length greater than 0.
  //postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  int ans = -1;
  for (int i = 0; i < sWord.length(); i++) {
    String t = sWord.substring(i, i+1);
    if (t.equals("a") || t.equals("e") || t.equals("i") || t.equals("o") || t.equals("u")) {
      ans = i;
      break;
    }
  }
  return ans;
}

public String pigLatin(String sWord)
  //precondition: sWord is a valid String of length greater than 0
  //postcondition: returns the pig latin equivalent of sWord
{
  // Rule 1
  if (findFirstVowel(sWord) == -1)
  {
    return sWord + "ay";
  }
  // Rule 2
  if (sWord.substring(0, 1).equals("a") || sWord.substring(0, 1).equals("e") || sWord.substring(0, 1).equals("i") || sWord.substring(0, 1).equals("o") || sWord.substring(0, 1).equals("u")) {
    return sWord + "way";
  }
  // Rule 3
  if (sWord.substring(0, 2).equals("qu")) {
    return sWord.substring(2, sWord.length()) + "quay";
  }
  // Rule 4
  if (!sWord.substring(0, 1).equals("a") || !sWord.substring(0, 1).equals("e") || !sWord.substring(0, 1).equals("i") || !sWord.substring(0, 1).equals("o") || !sWord.substring(0, 1).equals("u")) {
    return sWord.substring(findFirstVowel(sWord), sWord.length()) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
  } else
  {
    return "ERROR!";
  }
}
