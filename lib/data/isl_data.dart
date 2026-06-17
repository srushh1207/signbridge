import 'package:flutter/material.dart';

class ISLSign {
  final String wordEn;
  final String wordHi;
  final String descEn;
  final String descHi;
  final String category;
  final IconData icon;

  const ISLSign({
    required this.wordEn,
    required this.wordHi,
    required this.descEn,
    required this.descHi,
    required this.category,
    required this.icon,
  });
}

class ISLCategory {
  final String nameEn;
  final String nameHi;
  final String id;
  final IconData icon;
  final Color color;
  final String emojiIcon;

  const ISLCategory({
    required this.nameEn,
    required this.nameHi,
    required this.id,
    required this.icon,
    required this.color,
    required this.emojiIcon,
  });
}

class ISLData {
  static const List<ISLCategory> categories = [
    ISLCategory(
      id: 'alphabets',
      nameEn: 'Alphabets',
      nameHi: 'वर्णमाला',
      icon: Icons.abc_rounded,
      color: Color(0xFF3ECF8E),
      emojiIcon: '🔤',
    ),
    ISLCategory(
      id: 'numbers',
      nameEn: 'Numbers',
      nameHi: 'संख्याएँ',
      icon: Icons.pin_rounded,
      color: Color(0xFF5E6AD2),
      emojiIcon: '🔢',
    ),
    ISLCategory(
      id: 'greetings',
      nameEn: 'Greetings',
      nameHi: 'अभिवादन',
      icon: Icons.waving_hand_rounded,
      color: Color(0xFFFFB020),
      emojiIcon: '👋',
    ),
    ISLCategory(
      id: 'golden_words',
      nameEn: 'Golden Words',
      nameHi: 'सुनहरे शब्द',
      icon: Icons.star_rounded,
      color: Color(0xFFE8A838),
      emojiIcon: '✨',
    ),
    ISLCategory(
      id: 'family',
      nameEn: 'Family Relations',
      nameHi: 'पारिवारिक रिश्ते',
      icon: Icons.people_rounded,
      color: Color(0xFFE05D8C),
      emojiIcon: '👨‍👩‍👧‍👦',
    ),
    ISLCategory(
      id: 'colors',
      nameEn: 'Colors',
      nameHi: 'रंग',
      icon: Icons.palette_rounded,
      color: Color(0xFF42A5F5),
      emojiIcon: '🎨',
    ),
  ];

  static const List<ISLSign> signs = [
    // ═══════════════════════════════════════════
    // ALPHABETS (A-Z)
    // ═══════════════════════════════════════════
    ISLSign(
      wordEn: 'A', wordHi: 'A (ए)',
      descEn: 'Make a fist with your thumb resting on the side of your index finger, facing outward.',
      descHi: 'मुट्ठी बंद करें, अंगूठा तर्जनी के बगल में रखें, बाहर की ओर।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'B', wordHi: 'B (बी)',
      descEn: 'Open palm facing outward, all fingers together pointing up, thumb folded across the palm.',
      descHi: 'खुली हथेली बाहर की ओर, सभी उंगलियाँ ऊपर, अंगूठा हथेली पर मोड़ें।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'C', wordHi: 'C (सी)',
      descEn: 'Curve your fingers and thumb to form a C shape, like holding a cup.',
      descHi: 'उंगलियों और अंगूठे को C आकार में मोड़ें, जैसे कप पकड़ रहे हों।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'D', wordHi: 'D (डी)',
      descEn: 'Touch your index finger tip to your thumb tip forming a circle, other fingers point up.',
      descHi: 'तर्जनी और अंगूठे की नोक मिलाकर गोला बनाएं, बाकी उंगलियाँ ऊपर।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'E', wordHi: 'E (ई)',
      descEn: 'Curl all fingertips down to touch the top of your palm, thumb tucked below.',
      descHi: 'सभी उंगलियों की नोक हथेली के ऊपर मोड़ें, अंगूठा नीचे दबाएं।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'F', wordHi: 'F (एफ़)',
      descEn: 'Touch index finger to thumb making a circle; middle, ring, and pinky fingers extend up.',
      descHi: 'तर्जनी और अंगूठे से गोला बनाएं; मध्य, अनामिका और छोटी उंगली ऊपर।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'G', wordHi: 'G (जी)',
      descEn: 'Point your index finger sideways with thumb parallel below it, other fingers curled.',
      descHi: 'तर्जनी बगल की ओर इंगित करें, अंगूठा नीचे समानांतर, बाकी उंगलियाँ मोड़ें।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'H', wordHi: 'H (एच)',
      descEn: 'Extend index and middle fingers pointing sideways together, other fingers curled.',
      descHi: 'तर्जनी और मध्य उंगली बगल की ओर साथ में फैलाएं, बाकी मोड़ें।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'I', wordHi: 'I (आई)',
      descEn: 'Make a fist with only the pinky finger extended straight up.',
      descHi: 'मुट्ठी बंद करें, केवल छोटी उंगली सीधी ऊपर।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'J', wordHi: 'J (जे)',
      descEn: 'Start with pinky up (like I), then trace a J shape in the air by curving downward.',
      descHi: 'छोटी उंगली ऊपर (I जैसे), फिर हवा में J आकार बनाएं।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'K', wordHi: 'K (के)',
      descEn: 'Index finger points up, middle finger points forward, thumb touches middle finger.',
      descHi: 'तर्जनी ऊपर, मध्य उंगली आगे, अंगूठा मध्य उंगली को छुए।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'L', wordHi: 'L (एल)',
      descEn: 'Extend index finger up and thumb out to the side forming an L shape.',
      descHi: 'तर्जनी ऊपर और अंगूठा बगल में फैलाकर L आकार बनाएं।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'M', wordHi: 'M (एम)',
      descEn: 'Place thumb under first three fingers (index, middle, ring) with fingers over thumb.',
      descHi: 'अंगूठे को पहली तीन उंगलियों (तर्जनी, मध्य, अनामिका) के नीचे रखें।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'N', wordHi: 'N (एन)',
      descEn: 'Place thumb under first two fingers (index, middle) with fingers draped over.',
      descHi: 'अंगूठे को पहली दो उंगलियों (तर्जनी, मध्य) के नीचे रखें।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'O', wordHi: 'O (ओ)',
      descEn: 'Curve all fingers to touch the thumb tip, forming a round O shape.',
      descHi: 'सभी उंगलियों को अंगूठे की नोक से मिलाकर गोल O आकार बनाएं।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'P', wordHi: 'P (पी)',
      descEn: 'Like K but pointing downward — index up, middle forward and down, thumb on middle.',
      descHi: 'K जैसा पर नीचे की ओर — तर्जनी ऊपर, मध्य उंगली आगे और नीचे।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'Q', wordHi: 'Q (क्यू)',
      descEn: 'Like G but pointing downward — index finger and thumb pointing down together.',
      descHi: 'G जैसा पर नीचे की ओर — तर्जनी और अंगूठा नीचे की ओर साथ में।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'R', wordHi: 'R (आर)',
      descEn: 'Cross your index and middle fingers while extending them upward.',
      descHi: 'तर्जनी और मध्य उंगली को ऊपर की ओर क्रॉस करें।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'S', wordHi: 'S (एस)',
      descEn: 'Make a fist with your thumb wrapped across the front of your curled fingers.',
      descHi: 'मुट्ठी बंद करें, अंगूठा मोड़ी हुई उंगलियों के सामने लपेटें।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'T', wordHi: 'T (टी)',
      descEn: 'Make a fist with your thumb tucked between index and middle fingers.',
      descHi: 'मुट्ठी बंद करें, अंगूठा तर्जनी और मध्य उंगली के बीच दबाएं।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'U', wordHi: 'U (यू)',
      descEn: 'Extend index and middle fingers together pointing up, other fingers curled.',
      descHi: 'तर्जनी और मध्य उंगली साथ में ऊपर, बाकी उंगलियाँ मोड़ें।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'V', wordHi: 'V (वी)',
      descEn: 'Extend index and middle fingers apart in a V shape, other fingers curled.',
      descHi: 'तर्जनी और मध्य उंगली V आकार में अलग फैलाएं, बाकी मोड़ें।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'W', wordHi: 'W (डब्ल्यू)',
      descEn: 'Extend index, middle, and ring fingers spread apart, thumb holds pinky.',
      descHi: 'तर्जनी, मध्य और अनामिका फैलाएं, अंगूठा छोटी उंगली पकड़े।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'X', wordHi: 'X (एक्स)',
      descEn: 'Extend and bend your index finger into a hook shape, other fingers in fist.',
      descHi: 'तर्जनी को हुक आकार में मोड़ें, बाकी उंगलियाँ मुट्ठी में।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'Y', wordHi: 'Y (वाई)',
      descEn: 'Extend thumb and pinky finger outward, other fingers curled into palm.',
      descHi: 'अंगूठा और छोटी उंगली बाहर, बाकी उंगलियाँ हथेली में मोड़ें।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),
    ISLSign(
      wordEn: 'Z', wordHi: 'Z (ज़ेड)',
      descEn: 'Point your index finger forward and trace a Z shape in the air.',
      descHi: 'तर्जनी आगे की ओर इंगित करें और हवा में Z आकार बनाएं।',
      category: 'alphabets', icon: Icons.abc_rounded,
    ),

    // ═══════════════════════════════════════════
    // NUMBERS (0-9)
    // ═══════════════════════════════════════════
    ISLSign(
      wordEn: '0 (Zero)', wordHi: '0 (शून्य)',
      descEn: 'Form a circle with all fingers touching the thumb, similar to the letter O.',
      descHi: 'सभी उंगलियों को अंगूठे से मिलाकर गोला बनाएं, O अक्षर जैसा।',
      category: 'numbers', icon: Icons.pin_rounded,
    ),
    ISLSign(
      wordEn: '1 (One)', wordHi: '1 (एक)',
      descEn: 'Extend your index finger straight up, curl all other fingers into your palm.',
      descHi: 'तर्जनी सीधी ऊपर, बाकी सभी उंगलियाँ हथेली में मोड़ें।',
      category: 'numbers', icon: Icons.pin_rounded,
    ),
    ISLSign(
      wordEn: '2 (Two)', wordHi: '2 (दो)',
      descEn: 'Extend index and middle fingers upward in a V shape, other fingers curled.',
      descHi: 'तर्जनी और मध्य उंगली V आकार में ऊपर, बाकी मोड़ें।',
      category: 'numbers', icon: Icons.pin_rounded,
    ),
    ISLSign(
      wordEn: '3 (Three)', wordHi: '3 (तीन)',
      descEn: 'Extend thumb, index, and middle fingers while ring and pinky are curled.',
      descHi: 'अंगूठा, तर्जनी और मध्य उंगली फैलाएं, अनामिका और छोटी मोड़ें।',
      category: 'numbers', icon: Icons.pin_rounded,
    ),
    ISLSign(
      wordEn: '4 (Four)', wordHi: '4 (चार)',
      descEn: 'Extend all four fingers upward with the thumb folded across the palm.',
      descHi: 'चारों उंगलियाँ ऊपर, अंगूठा हथेली पर मोड़ें।',
      category: 'numbers', icon: Icons.pin_rounded,
    ),
    ISLSign(
      wordEn: '5 (Five)', wordHi: '5 (पाँच)',
      descEn: 'Open your entire hand with all five fingers spread apart.',
      descHi: 'पूरा हाथ खोलें, सभी पाँच उंगलियाँ अलग-अलग फैलाएं।',
      category: 'numbers', icon: Icons.pin_rounded,
    ),
    ISLSign(
      wordEn: '6 (Six)', wordHi: '6 (छह)',
      descEn: 'Extend thumb and pinky finger, curl index, middle, and ring fingers.',
      descHi: 'अंगूठा और छोटी उंगली फैलाएं, तर्जनी, मध्य और अनामिका मोड़ें।',
      category: 'numbers', icon: Icons.pin_rounded,
    ),
    ISLSign(
      wordEn: '7 (Seven)', wordHi: '7 (सात)',
      descEn: 'Extend thumb, index, and pinky finger; curl middle and ring fingers.',
      descHi: 'अंगूठा, तर्जनी और छोटी उंगली फैलाएं; मध्य और अनामिका मोड़ें।',
      category: 'numbers', icon: Icons.pin_rounded,
    ),
    ISLSign(
      wordEn: '8 (Eight)', wordHi: '8 (आठ)',
      descEn: 'Extend thumb, index, middle, and pinky; curl only the ring finger.',
      descHi: 'अंगूठा, तर्जनी, मध्य और छोटी उंगली फैलाएं; केवल अनामिका मोड़ें।',
      category: 'numbers', icon: Icons.pin_rounded,
    ),
    ISLSign(
      wordEn: '9 (Nine)', wordHi: '9 (नौ)',
      descEn: 'Touch index fingertip to thumb forming a circle, extend remaining three fingers.',
      descHi: 'तर्जनी और अंगूठे की नोक मिलाकर गोला बनाएं, बाकी तीन उंगलियाँ फैलाएं।',
      category: 'numbers', icon: Icons.pin_rounded,
    ),

    // ═══════════════════════════════════════════
    // GREETINGS
    // ═══════════════════════════════════════════
    ISLSign(
      wordEn: 'Hello', wordHi: 'नमस्ते',
      descEn: 'Wave your open hand from side to side near your face, palm facing outward.',
      descHi: 'अपने खुले हाथ को चेहरे के पास इधर-उधर हिलाएं, हथेली बाहर की ओर।',
      category: 'greetings', icon: Icons.waving_hand_rounded,
    ),
    ISLSign(
      wordEn: 'Good Morning', wordHi: 'सुप्रभात',
      descEn: 'Touch fingertips to chin, then move hand outward and slightly upward like the rising sun.',
      descHi: 'उंगलियों की नोक ठोड़ी पर रखें, फिर हाथ बाहर और ऊपर ले जाएं जैसे सूरज उगता है।',
      category: 'greetings', icon: Icons.wb_sunny_rounded,
    ),
    ISLSign(
      wordEn: 'Good Night', wordHi: 'शुभ रात्रि',
      descEn: 'Place both palms together near the side of your face, tilting your head slightly.',
      descHi: 'दोनों हथेलियां चेहरे के बगल में जोड़ें, सिर को थोड़ा झुकाएं।',
      category: 'greetings', icon: Icons.nightlight_rounded,
    ),
    ISLSign(
      wordEn: 'How are you?', wordHi: 'आप कैसे हैं?',
      descEn: 'Point to the other person, then move both fists with thumbs up in alternating up-down motion.',
      descHi: 'दूसरे व्यक्ति की ओर इशारा करें, फिर दोनों मुट्ठियों को अंगूठे ऊपर करके ऊपर-नीचे हिलाएं।',
      category: 'greetings', icon: Icons.question_mark_rounded,
    ),
    ISLSign(
      wordEn: 'Goodbye', wordHi: 'अलविदा',
      descEn: 'Open palm facing outward, wave gently from side to side while moving away.',
      descHi: 'खुली हथेली बाहर की ओर, हाथ को धीरे-धीरे इधर-उधर हिलाते हुए दूर ले जाएं।',
      category: 'greetings', icon: Icons.back_hand_rounded,
    ),
    ISLSign(
      wordEn: 'Nice to meet you', wordHi: 'आपसे मिलकर अच्छा लगा',
      descEn: 'Point to yourself, then bring both flat hands together in a handshake motion.',
      descHi: 'अपनी ओर इशारा करें, फिर दोनों सपाट हाथों को हैंडशेक जैसे मिलाएं।',
      category: 'greetings', icon: Icons.handshake_rounded,
    ),

    // ═══════════════════════════════════════════
    // GOLDEN WORDS
    // ═══════════════════════════════════════════
    ISLSign(
      wordEn: 'Please', wordHi: 'कृपया',
      descEn: 'Place your flat palm on your chest and rub gently in a circular motion.',
      descHi: 'अपनी सपाट हथेली छाती पर रखें और धीरे से गोलाकार गति में घुमाएं।',
      category: 'golden_words', icon: Icons.volunteer_activism_rounded,
    ),
    ISLSign(
      wordEn: 'Thank You', wordHi: 'धन्यवाद',
      descEn: 'Touch your fingertips to your lips, then move your hand outward and downward.',
      descHi: 'अपनी उंगलियों की नोक होठों पर रखें, फिर हाथ बाहर और नीचे ले जाएं।',
      category: 'golden_words', icon: Icons.favorite_rounded,
    ),
    ISLSign(
      wordEn: 'Sorry', wordHi: 'माफ़ करें',
      descEn: 'Make a fist and rub it in a circular motion over your chest.',
      descHi: 'मुट्ठी बनाएं और छाती पर गोलाकार गति में घुमाएं।',
      category: 'golden_words', icon: Icons.sentiment_dissatisfied_rounded,
    ),
    ISLSign(
      wordEn: 'Excuse Me', wordHi: 'क्षमा करें',
      descEn: 'Brush your fingertips along the opposite forearm from elbow to wrist, twice.',
      descHi: 'अपनी उंगलियों की नोक विपरीत बांह पर कोहनी से कलाई तक दो बार घुमाएं।',
      category: 'golden_words', icon: Icons.back_hand_outlined,
    ),
    ISLSign(
      wordEn: 'Welcome', wordHi: 'स्वागत',
      descEn: 'Extend your open hand outward from your body in a sweeping welcoming gesture.',
      descHi: 'अपना खुला हाथ शरीर से बाहर की ओर स्वागत करते हुए फैलाएं।',
      category: 'golden_words', icon: Icons.emoji_people_rounded,
    ),
    ISLSign(
      wordEn: 'I Love You', wordHi: 'मैं आपसे प्यार करता/करती हूँ',
      descEn: 'Extend thumb, index, and pinky fingers simultaneously while curling middle and ring fingers.',
      descHi: 'अंगूठा, तर्जनी और छोटी उंगली एक साथ फैलाएं, मध्य और अनामिका मोड़ें।',
      category: 'golden_words', icon: Icons.favorite_border_rounded,
    ),

    // ═══════════════════════════════════════════
    // FAMILY RELATIONS
    // ═══════════════════════════════════════════
    ISLSign(
      wordEn: 'Mother', wordHi: 'माँ',
      descEn: 'Tap the side of your chin twice with your index finger.',
      descHi: 'अपनी तर्जनी से ठोड़ी के किनारे दो बार टैप करें।',
      category: 'family', icon: Icons.female_rounded,
    ),
    ISLSign(
      wordEn: 'Father', wordHi: 'पिता',
      descEn: 'Tap the side of your forehead twice with your index finger.',
      descHi: 'अपनी तर्जनी से माथे के किनारे दो बार टैप करें।',
      category: 'family', icon: Icons.male_rounded,
    ),
    ISLSign(
      wordEn: 'Brother', wordHi: 'भाई',
      descEn: 'Place two index fingers together side by side, pointing forward at chest height.',
      descHi: 'दो तर्जनी उंगलियां छाती की ऊंचाई पर आगे की ओर साथ-साथ रखें।',
      category: 'family', icon: Icons.boy_rounded,
    ),
    ISLSign(
      wordEn: 'Sister', wordHi: 'बहन',
      descEn: 'Cross your two index fingers in an X shape at chest level.',
      descHi: 'अपनी दो तर्जनी उंगलियों को छाती के स्तर पर X आकार में क्रॉस करें।',
      category: 'family', icon: Icons.girl_rounded,
    ),
    ISLSign(
      wordEn: 'Grandfather', wordHi: 'दादा/नाना',
      descEn: 'Sign Father, then move the hand forward in a small arc (indicating older generation).',
      descHi: 'पिता का इशारा करें, फिर हाथ को छोटे चाप में आगे ले जाएं (बड़ी पीढ़ी दर्शाते हुए)।',
      category: 'family', icon: Icons.elderly_rounded,
    ),
    ISLSign(
      wordEn: 'Grandmother', wordHi: 'दादी/नानी',
      descEn: 'Sign Mother, then move the hand forward in a small arc (indicating older generation).',
      descHi: 'माँ का इशारा करें, फिर हाथ को छोटे चाप में आगे ले जाएं (बड़ी पीढ़ी दर्शाते हुए)।',
      category: 'family', icon: Icons.elderly_woman_rounded,
    ),
    ISLSign(
      wordEn: 'Friend', wordHi: 'दोस्त',
      descEn: 'Hook your index fingers together, pull apart, then hook again.',
      descHi: 'अपनी तर्जनी उंगलियों को एक-दूसरे में फंसाएं, अलग करें, फिर दोबारा फंसाएं।',
      category: 'family', icon: Icons.people_alt_rounded,
    ),

    // ═══════════════════════════════════════════
    // COLORS
    // ═══════════════════════════════════════════
    ISLSign(
      wordEn: 'Red', wordHi: 'लाल',
      descEn: 'Stroke your index finger downward across your lips, then point to something red.',
      descHi: 'अपनी तर्जनी को होठों पर नीचे की ओर घुमाएं, फिर किसी लाल चीज़ की ओर इशारा करें।',
      category: 'colors', icon: Icons.circle,
    ),
    ISLSign(
      wordEn: 'Blue', wordHi: 'नीला',
      descEn: 'Shake the letter B hand sign slightly while moving it to the side.',
      descHi: 'B अक्षर के हाथ के इशारे को बगल की ओर ले जाते हुए हल्के से हिलाएं।',
      category: 'colors', icon: Icons.circle,
    ),
    ISLSign(
      wordEn: 'Green', wordHi: 'हरा',
      descEn: 'Sign the letter G, then twist your wrist back and forth.',
      descHi: 'G अक्षर का इशारा करें, फिर अपनी कलाई को आगे-पीछे घुमाएं।',
      category: 'colors', icon: Icons.circle,
    ),
    ISLSign(
      wordEn: 'Yellow', wordHi: 'पीला',
      descEn: 'Sign the letter Y and shake it slightly from side to side.',
      descHi: 'Y अक्षर का इशारा करें और इसे हल्के से इधर-उधर हिलाएं।',
      category: 'colors', icon: Icons.circle,
    ),
    ISLSign(
      wordEn: 'Orange', wordHi: 'नारंगी',
      descEn: 'Squeeze and release your fist near your chin, mimicking squeezing an orange.',
      descHi: 'अपनी मुट्ठी को ठोड़ी के पास दबाएं और छोड़ें, जैसे संतरा निचोड़ रहे हों।',
      category: 'colors', icon: Icons.circle,
    ),
    ISLSign(
      wordEn: 'White', wordHi: 'सफ़ेद',
      descEn: 'Place your open hand on your chest and pull it away while closing fingers together.',
      descHi: 'अपना खुला हाथ छाती पर रखें और उंगलियां बंद करते हुए दूर खींचें।',
      category: 'colors', icon: Icons.circle,
    ),
    ISLSign(
      wordEn: 'Black', wordHi: 'काला',
      descEn: 'Draw your index finger across your forehead from one side to the other.',
      descHi: 'अपनी तर्जनी को माथे पर एक तरफ से दूसरी तरफ खींचें।',
      category: 'colors', icon: Icons.circle,
    ),
    ISLSign(
      wordEn: 'Pink', wordHi: 'गुलाबी',
      descEn: 'Sign the letter P, then brush your middle finger downward across your lips.',
      descHi: 'P अक्षर का इशारा करें, फिर मध्य उंगली को होठों पर नीचे की ओर घुमाएं।',
      category: 'colors', icon: Icons.circle,
    ),
  ];

  static List<ISLSign> getByCategory(String categoryId) {
    return signs.where((s) => s.category == categoryId).toList();
  }

  static ISLCategory? getCategoryById(String id) {
    try {
      return categories.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }
}
