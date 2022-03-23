# PowerShell Essentials Pipelines Homework
# 2. Write a script to find the occurrences of 10 most common words in a given text. Use any article from Wikipedia as given text. Use pipelines as match as possible.


<# Code starts here #>
$text = "Romeo  and  Juliet  is	 a tragedy written	 by William Shakespeare early in his career about two young Italian star-crossed lovers whose deaths ultimately reconcile their feuding families! It was among Shakespeare's most popular plays   during his lifetime and, along with Hamlet, is one of his most frequently performed plays? Today, the title characters are regarded: as archetypal; young lovers.
Romeo and Juliet belongs to a tradition of tragic romances stretching back to antiquity. The plot is based on an Italian tale translated into verse as The Tragical History of Romeus and Juliet by Arthur Brooke in 1562 and retold in prose in Palace of Pleasure by William Painter in 1567. Shakespeare borrowed heavily from both but expanded the plot by developing a number of supporting characters, particularly Mercutio and Paris. Believed to have been written between 1591 and 1595, the play was first published in a quarto version in 1597. The text of the first quarto version was of poor quality, however, and later editions corrected the text to conform more closely with Shakespeare's original.
Shakespeare's use of his poetic dramatic structure (especially effects such as switching between comedy and tragedy to heighten tension, his expansion of minor characters, and his use of sub-plots to embellish the story) has been praised as an early sign of his dramatic skill. The play ascribes different poetic forms to different characters, sometimes changing the form as the character develops. Romeo, for example, grows more adept at the sonnet over the course of the play.
Romeo and Juliet has been adapted numerous times for stage, film, musical, and opera venues. During the English Restoration, it was revived and heavily revised by William Davenant. David Garrick's 18th-century version also modified several scenes, removing material then considered indecent, and Georg Benda's Romeo und Julie omitted much of the action and used a happy ending. Performances in the 19th century, including Charlotte Cushman's, restored the original text and focused on greater realism. John Gielgud's 1935 version kept very close to Shakespeare's text and used Elizabethan costumes and staging to enhance the drama. In the 20th and into the 21st century, the play has been adapted in versions as diverse as George Cukor's 1936 film Romeo and Juliet, Franco Zeffirelli's 1968 version Romeo and Juliet, and Baz Luhrmann's 1996 MTV-inspired Romeo + Juliet."

$words = $text -split "'s" -split '[\s+,\.:;\?\!\t()-]' | Where-Object { $_.length -gt 0 }
$mostCommon = (($words | Group-Object | Sort-Object Count)[-1..-10])
Write-Host $mostCommon.Name
$mostCommon
<# Code ends here #>


<# Executing the script
& .\hometask2@09_Pipelines.ps1
# Output

the and of in to Romeo his Juliet as Shakespeare

Count Name                      Group
----- ----                      -----
   23 the                       {the, The, The, the…}
   22 and                       {and, and, and, and…}
   13 of                        {of, of, of, of…}
   10 in                        {in, in, in, in…}
    9 to                        {to, to, to, to…}
    8 Romeo                     {Romeo, Romeo, Romeo, Romeo…}
    7 his                       {his, his, his, his…}
    7 Juliet                    {Juliet, Juliet, Juliet, Juliet…}
    7 as                        {as, as, as, as…}
    6 Shakespeare               {Shakespeare, Shakespeare, Shakespeare, Shakespeare…}
#>
