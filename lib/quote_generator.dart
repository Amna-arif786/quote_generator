import 'package:flutter/material.dart';

class QuoteGeneratorApp extends StatelessWidget {
  const QuoteGeneratorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF6F8F8),
        fontFamily: 'Inter',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF102220),
        fontFamily: 'Inter',
      ),
      themeMode: ThemeMode.dark,
      home: const QuoteGeneratorHome(),
    );
  }
}

class QuoteGeneratorHome extends StatefulWidget {
  const QuoteGeneratorHome({Key? key}) : super(key: key);

  @override
  State<QuoteGeneratorHome> createState() => _QuoteGeneratorHomeState();
}

class _QuoteGeneratorHomeState extends State<QuoteGeneratorHome> {
  int currentQuoteIndex = 0;
  String selectedCategory = 'Motivational';
//motivational
  final List<Map<String, String>> motivationalQuotes = [
    {'quote': 'The only way to do great work is to love what you do.', 'author': 'Steve Jobs'},
    {'quote': 'The best revenge is to be unlike him who performed the injury.', 'author': 'Marcus Aurelius'},
    {'quote': 'You have power over your mind - not outside events. Realize this, and you will find strength.', 'author': 'Marcus Aurelius'},
    {'quote': 'The happiness of your life depends upon the quality of your thoughts.', 'author': 'Marcus Aurelius'},
    {'quote': 'Life is what happens when you\'re busy making other plans.', 'author': 'John Lennon'},
    {'quote': 'The purpose of our lives is to be happy.', 'author': 'Dalai Lama'},
    {'quote': 'Success is not final, failure is not fatal: it is the courage to continue that counts.', 'author': 'Winston Churchill'},
    {'quote': 'Believe you can and you\'re halfway there.', 'author': 'Theodore Roosevelt'},
    {'quote': 'Hardships often prepare ordinary people for an extraordinary destiny.', 'author': 'C.S. Lewis'},
    {'quote': 'What we think, we become.', 'author': 'Buddha'},
    {'quote': 'Do what you can, with what you have, where you are.', 'author': 'Theodore Roosevelt'},
    {'quote': 'Dream big and dare to fail.', 'author': 'Norman Vaughan'},
    {'quote': 'Don’t watch the clock; do what it does. Keep going.', 'author': 'Sam Levenson'},
    {'quote': 'The future belongs to those who believe in the beauty of their dreams.', 'author': 'Eleanor Roosevelt'},
    {'quote': 'It does not matter how slowly you go as long as you do not stop.', 'author': 'Confucius'},
    {'quote': 'Everything you’ve ever wanted is sitting on the other side of fear.', 'author': 'George Addair'},
    {'quote': 'If you want to lift yourself up, lift up someone else.', 'author': 'Booker T. Washington'},
    {'quote': 'Opportunities don’t happen. You create them.', 'author': 'Chris Grosser'},
    {'quote': 'The harder you work for something, the greater you’ll feel when you achieve it.', 'author': 'Anonymous'},
    {'quote': 'Don’t quit. Suffer now and live the rest of your life as a champion.', 'author': 'Muhammad Ali'},
    {'quote': 'If you are not willing to risk the usual, you will have to settle for the ordinary.', 'author': 'Jim Rohn'},
    {'quote': 'Great things never come from comfort zones.', 'author': 'Anonymous'},
    {'quote': 'The way to get started is to quit talking and begin doing.', 'author': 'Walt Disney'},
    {'quote': 'Don’t let yesterday take up too much of today.', 'author': 'Will Rogers'},
    {'quote': 'Act as if what you do makes a difference. It does.', 'author': 'William James'},
  ];
//islamic
  final List<Map<String, String>> islamicQuotes = [
    {'quote': 'Indeed, Allah is with the patient.', 'author': 'Quran 2:153'},
    {'quote': 'So remember Me; I will remember you.', 'author': 'Quran 2:152'},
    {'quote': 'Allah does not burden a soul beyond that it can bear.', 'author': 'Quran 2:286'},
    {'quote': 'And He found you lost and guided [you].', 'author': 'Quran 93:7'},
    {'quote': 'Whoever relies upon Allah – then He is sufficient for him.', 'author': 'Quran 65:3'},
    {'quote': 'Do not despair of the mercy of Allah.', 'author': 'Quran 39:53'},
    {'quote': 'Indeed, with hardship comes ease.', 'author': 'Quran 94:6'},
    {'quote': 'And seek help through patience and prayer.', 'author': 'Quran 2:45'},
    {'quote': 'Verily, in the remembrance of Allah do hearts find rest.', 'author': 'Quran 13:28'},
    {'quote': 'Allah is the best of planners.', 'author': 'Quran 8:30'},
    {'quote': 'Say: My Lord, increase me in knowledge.', 'author': 'Quran 20:114'},
    {'quote': 'And whoever fears Allah – He will make a way for him to get out.', 'author': 'Quran 65:2'},
    {'quote': 'Be mindful of Allah and He will protect you.', 'author': 'Hadith'},
    {'quote': 'The best among you are those who learn the Quran and teach it.', 'author': 'Hadith'},
    {'quote': 'The strongest among you is the one who controls his anger.', 'author': 'Hadith'},
    {'quote': 'Make things easy and do not make them difficult.', 'author': 'Hadith'},
    {'quote': 'The best charity is that given when one is in need.', 'author': 'Hadith'},
    {'quote': 'Seek knowledge from the cradle to the grave.', 'author': 'Hadith'},
    {'quote': 'The most beloved deeds to Allah are those done consistently.', 'author': 'Hadith'},
    {'quote': 'Speak good or remain silent.', 'author': 'Hadith'},
    {'quote': 'Richness is not having many possessions, but richness is the richness of the soul.', 'author': 'Hadith'},
    {'quote': 'He who has no manners has no knowledge.', 'author': 'Hadith'},
  ];
//urdu

  final List<Map<String, String>> urduQuotes = [
    {'quote': 'Aaj ka kaam kal par mat chhodo.', 'author': 'Quaid-e-Azam'},
    {'quote': 'Khudi ko kar buland itna ke har taqdeer se pehle, Khuda bande se khud pooche, bata teri raza kya hai.', 'author': 'Allama Iqbal'},
    {'quote': 'Zindagi aik rang hai, use maze se jeo.', 'author': 'Rumi'},
    {'quote': 'Mehnat itni khamoshi se karo ke kamyabi shor macha de.', 'author': 'Allama Iqbal'},
    {'quote': 'Har pal mein zindagi ka maza hai, har pal seekho aur muskurao.', 'author': 'Rumi'},
    {'quote': 'Insaan apni soch se banta hai, uski soch hi uski taaqat hai.', 'author': 'Wasif Ali Wasif'},
    {'quote': 'Jo waqt ka qadr karta hai, waqt uska qadr karta hai.', 'author': 'Sheikh Saadi'},
    {'quote': 'Agar tum khud ko pehchano, tum duniya ko bhi pehchan loge.', 'author': 'Allama Iqbal'},
    {'quote': 'Ilm aur amal se hi qaum taraqqi karti hai.', 'author': 'Quaid-e-Azam'},
    {'quote': 'Dil ka sukoon sirf mohabbat aur shukr se milta hai.', 'author': 'Rumi'},
    {'quote': 'Himmat aur sabr se har mushkil aasan ho jati hai.', 'author': 'Wasif Ali Wasif'},
    {'quote': 'Khudi ko itna buland karo ke tumhari khushi har mushkil ko har lay.', 'author': 'Allama Iqbal'},
    {'quote': 'Jahan mein sabse bada insaan wahi hai jo apni khudi ko pehchanta hai.', 'author': 'Allama Iqbal'},
    {'quote': 'Aqalmand wo hai jo apne ghalatiyon se seekhta hai.', 'author': 'Sheikh Saadi'},
    {'quote': 'Mohabbat hi rooh ko qadr deti hai, is mein sab kuch hai.', 'author': 'Rumi'},
    {'quote': 'Kamyabi sirf himmat aur mehnat se milti hai.', 'author': 'Quaid-e-Azam'},
    {'quote': 'Jo kuch bhi milta hai us par shukar karo, ye sabse bara ilm hai.', 'author': 'Wasif Ali Wasif'},
    {'quote': 'Har waqt seekhte raho, aur apne aqaid par qaim raho.', 'author': 'Quaid-e-Azam'},
    {'quote': 'Agar insaan apni rooh ko samajh le to woh sab kuch samajh jata hai.', 'author': 'Rumi'},
    {'quote': 'Andhera jitna gehra, roshni utni chamakti hai.', 'author': 'Rumi'},
  ];

  List<Map<String, String>> get currentQuotes {
    switch (selectedCategory) {
      case 'Motivational':
        return motivationalQuotes;
      case 'Islamic':
        return islamicQuotes;
      case 'Urdu':
        return urduQuotes;
      default:
        return motivationalQuotes;
    }
  }

  void generateNewQuote() {
    setState(() {
      currentQuoteIndex = (currentQuoteIndex + 1) % currentQuotes.length;
    });
  }

  void changeCategory(String category) {
    setState(() {
      selectedCategory = category;
      currentQuoteIndex = 0;
    });
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFF13ECDA);
    final backgroundColor = isDark ? Colors.black : Colors.white;
    final cardBgColor = isDark ? const Color(0xFF102220) : const Color(0xFFF1F1F1);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 428),
          margin: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getGreeting(),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : const Color(0xFF111827),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1F2937) : const Color(0xFFE5E7EB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
              // Category Selector
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: ['Motivational', 'Islamic', 'Urdu'].map((cat) {
                    final isSelected = selectedCategory == cat;
                    return GestureDetector(
                      onTap: () => changeCategory(cat),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? primaryColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: primaryColor),
                        ),
                        child: Text(
                          cat,
                          style: TextStyle(
                            color: isSelected ? Colors.black : primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              // Quote Card
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: cardBgColor,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '"',
                                style: TextStyle(
                                  fontSize: 80,
                                  height: 0.8,
                                  fontWeight: FontWeight.w300,
                                  color: primaryColor.withOpacity(isDark ? 0.6 : 0.8),
                                  fontFamily: 'serif',
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    currentQuotes[currentQuoteIndex]['quote']!,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      height: 1.4,
                                      color: isDark ? const Color(0xFFF3F4F6) : const Color(0xFF1F2937),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '— ${currentQuotes[currentQuoteIndex]['author']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Action button
                      Center(
                        child: GestureDetector(
                          onTap: generateNewQuote,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.refresh,
                              size: 40,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
