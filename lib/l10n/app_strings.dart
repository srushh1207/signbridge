import '../providers/language_provider.dart';

/// Centralized UI strings for English and Hindi.
/// Use: AppStrings.get('key', provider) to get the localized string.
class AppStrings {
  static const Map<String, Map<String, String>> _strings = {
    // ── General ──
    'app_name': {'en': 'SignBridge', 'hi': 'साइनब्रिज'},
    'tagline': {'en': 'Every sign builds a bridge.', 'hi': 'हर इशारा एक पुल बनाता है।'},
    'isl_label': {'en': 'INDIAN SIGN LANGUAGE', 'hi': 'भारतीय सांकेतिक भाषा'},

    // ── Language Selection ──
    'choose_language': {'en': 'Choose Your Language', 'hi': 'अपनी भाषा चुनें'},
    'lang_subtitle': {'en': 'Learn ISL in the language you\'re most comfortable with.', 'hi': 'उस भाषा में ISL सीखें जिसमें आप सबसे सहज हैं।'},
    'english': {'en': 'English', 'hi': 'अंग्रेज़ी'},
    'hindi': {'en': 'हिन्दी', 'hi': 'हिन्दी'},
    'continue_text': {'en': 'Continue', 'hi': 'जारी रखें'},

    // ── Onboarding ──
    'onboarding_title_1': {'en': 'Learn Indian Sign Language', 'hi': 'भारतीय सांकेतिक भाषा सीखें'},
    'onboarding_sub_1': {'en': 'Master ISL through bite-sized, interactive lessons designed to feel like games.', 'hi': 'खेल जैसे इंटरैक्टिव पाठों से ISL सीखें।'},
    'onboarding_title_2': {'en': 'Bridge the Communication Gap', 'hi': 'संवाद की खाई पाटें'},
    'onboarding_sub_2': {'en': 'Develop inclusive skills and connect with the Deaf and Hard of Hearing community.', 'hi': 'समावेशी कौशल विकसित करें और बधिर समुदाय से जुड़ें।'},
    'onboarding_title_3': {'en': 'Set Your Learning Goal', 'hi': 'अपना सीखने का लक्ष्य तय करें'},
    'onboarding_sub_3': {'en': 'Pick a daily target that fits your schedule. You can adjust this anytime in settings.', 'hi': 'अपने शेड्यूल के अनुसार दैनिक लक्ष्य चुनें। आप इसे कभी भी बदल सकते हैं।'},
    'skip': {'en': 'Skip', 'hi': 'छोड़ें'},
    'next': {'en': 'Next', 'hi': 'अगला'},
    'get_started': {'en': 'Get Started', 'hi': 'शुरू करें'},
    'casual': {'en': 'Casual', 'hi': 'आरामदायक'},
    'regular': {'en': 'Regular', 'hi': 'नियमित'},
    'serious': {'en': 'Serious', 'hi': 'गंभीर'},
    'intense': {'en': 'Intense', 'hi': 'तीव्र'},
    'min_per_day': {'en': 'min/day', 'hi': 'मिनट/दिन'},

    // ── Auth ──
    'welcome_back': {'en': 'Welcome back', 'hi': 'वापसी पर स्वागत'},
    'create_account': {'en': 'Create account', 'hi': 'खाता बनाएं'},
    'sign_in_subtitle': {'en': 'Sign in to continue your sign language journey.', 'hi': 'अपनी सांकेतिक भाषा यात्रा जारी रखने के लिए साइन इन करें।'},
    'sign_up_subtitle': {'en': 'Join SignBridge today and start learning ISL.', 'hi': 'आज ही साइनब्रिज से जुड़ें और ISL सीखना शुरू करें।'},
    'full_name': {'en': 'Full Name', 'hi': 'पूरा नाम'},
    'enter_name': {'en': 'Enter your name', 'hi': 'अपना नाम दर्ज करें'},
    'email': {'en': 'Email Address', 'hi': 'ईमेल पता'},
    'enter_email': {'en': 'Enter your email', 'hi': 'अपना ईमेल दर्ज करें'},
    'password': {'en': 'Password', 'hi': 'पासवर्ड'},
    'enter_password': {'en': 'Enter your password', 'hi': 'अपना पासवर्ड दर्ज करें'},
    'sign_in': {'en': 'Sign In', 'hi': 'साइन इन'},
    'sign_up': {'en': 'Sign Up', 'hi': 'साइन अप'},
    'forgot_password': {'en': 'Forgot Password?', 'hi': 'पासवर्ड भूल गए?'},
    'or': {'en': 'OR', 'hi': 'या'},
    'continue_google': {'en': 'Continue with Google', 'hi': 'Google से जारी रखें'},
    'continue_guest': {'en': 'Continue as Guest', 'hi': 'मेहमान के रूप में जारी रखें'},
    'no_account': {'en': "Don't have an account? ", 'hi': 'खाता नहीं है? '},
    'have_account': {'en': 'Already have an account? ', 'hi': 'पहले से खाता है? '},

    // ── Home Dashboard ──
    'daily_goal': {'en': 'Daily Learning Goal', 'hi': 'दैनिक सीखने का लक्ष्य'},
    'keep_streak': {'en': 'Complete 5 more minutes to keep streak alive!', 'hi': 'स्ट्रीक बनाए रखने के लिए 5 और मिनट पूरे करें!'},
    'learning_path': {'en': 'YOUR LEARNING PATH', 'hi': 'आपका सीखने का मार्ग'},
    'categories_title': {'en': 'LEARN BY CATEGORY', 'hi': 'श्रेणी से सीखें'},
    'focus_mode': {'en': '🌳 Focus Mode', 'hi': '🌳 फोकस मोड'},
    'focus_subtitle': {'en': 'Grow a tree while you study!', 'hi': 'पढ़ाई करते हुए पेड़ उगाएं!'},
    'start_focus': {'en': 'Start 5-Min Focus', 'hi': '5 मिनट फोकस शुरू करें'},
    'my_garden': {'en': 'My Garden', 'hi': 'मेरा बगीचा'},
    'motivational_quote': {
      'en': '"Every sign builds a bridge to a more connected and inclusive world."',
      'hi': '"हर इशारा एक अधिक जुड़ी और समावेशी दुनिया का पुल बनाता है।"'
    },
    'level': {'en': 'Level', 'hi': 'स्तर'},

    // ── Category ──
    'explore_category': {'en': 'Explore Category', 'hi': 'श्रेणी देखें'},
    'signs_count': {'en': 'signs', 'hi': 'इशारे'},
    'how_to_sign': {'en': 'HOW TO SIGN:', 'hi': 'इशारा कैसे करें:'},
    'practice_gesture': {'en': 'Practice Gesture', 'hi': 'इशारा अभ्यास करें'},

    // ── Dictionary ──
    'dictionary_title': {'en': 'ISL Dictionary', 'hi': 'ISL शब्दकोश'},
    'search_signs': {'en': 'Search sign language words...', 'hi': 'सांकेतिक भाषा शब्द खोजें...'},
    'all': {'en': 'All', 'hi': 'सभी'},
    'no_results': {'en': 'No signs match your filters', 'hi': 'कोई इशारा आपके फ़िल्टर से मेल नहीं खाता'},
    'try_adjusting': {'en': 'Try adjusting your search query or category.', 'hi': 'अपनी खोज या श्रेणी बदलकर देखें।'},

    // ── Practice ──
    'practice_title': {'en': 'Practice Arena', 'hi': 'अभ्यास क्षेत्र'},
    'practice_subtitle': {'en': 'Strengthen your skills and review progress.', 'hi': 'अपने कौशल को मजबूत करें और प्रगति देखें।'},
    'daily_challenges': {'en': 'DAILY CHALLENGES', 'hi': 'दैनिक चुनौतियाँ'},
    'weak_areas': {'en': 'WEAK AREAS TO IMPROVE', 'hi': 'सुधार के क्षेत्र'},
    'performance': {'en': 'PERFORMANCE ANALYTICS', 'hi': 'प्रदर्शन विश्लेषण'},
    'practice': {'en': 'Practice', 'hi': 'अभ्यास'},
    'weekly_consistency': {'en': 'Weekly Consistency', 'hi': 'साप्ताहिक निरंतरता'},

    // ── Achievements ──
    'achievements_title': {'en': 'Achievements', 'hi': 'उपलब्धियाँ'},
    'achievements_subtitle': {'en': 'Milestones reached on your path to fluency.', 'hi': 'धाराप्रवाह बनने के मार्ग पर हासिल मील के पत्थर।'},
    'badges_collection': {'en': 'BADGES COLLECTION', 'hi': 'बैज संग्रह'},
    'milestone_progress': {'en': 'Milestone Progress', 'hi': 'मील का पत्थर प्रगति'},
    'unlocked': {'en': 'Unlocked', 'hi': 'अनलॉक'},
    'locked': {'en': 'Locked', 'hi': 'लॉक'},

    // ── Profile ──
    'profile_title': {'en': 'Profile', 'hi': 'प्रोफ़ाइल'},
    'your_stats': {'en': 'YOUR STATISTICS', 'hi': 'आपके आँकड़े'},
    'app_settings': {'en': 'APPLICATION SETTINGS', 'hi': 'ऐप सेटिंग्स'},
    'log_out': {'en': 'Log Out Account', 'hi': 'खाते से लॉग आउट'},
    'change_goal': {'en': 'Change Learning Goal', 'hi': 'सीखने का लक्ष्य बदलें'},
    'adjust_targets': {'en': 'Adjust your daily minute targets.', 'hi': 'अपने दैनिक मिनट लक्ष्य समायोजित करें।'},

    // ── Focus Timer ──
    'focus_timer_title': {'en': 'Focus Session', 'hi': 'फोकस सत्र'},
    'growing_tree': {'en': 'Your tree is growing...', 'hi': 'आपका पेड़ बढ़ रहा है...'},
    'stay_focused': {'en': 'Stay focused! Don\'t leave or your tree will wilt.', 'hi': 'ध्यान रखें! मत जाइए वरना पेड़ मुरझा जाएगा।'},
    'tree_complete': {'en': '🎉 Tree Fully Grown!', 'hi': '🎉 पेड़ पूरा बड़ा हो गया!'},
    'tree_added': {'en': 'Added to your garden', 'hi': 'आपके बगीचे में जोड़ दिया गया'},
    'give_up': {'en': 'Give Up', 'hi': 'छोड़ दें'},
    'finish': {'en': 'Finish & Plant', 'hi': 'समाप्त करें और लगाएं'},
    'minutes_remaining': {'en': 'min remaining', 'hi': 'मिनट शेष'},

    // ── Focus Garden ──
    'garden_title': {'en': 'My Forest Garden', 'hi': 'मेरा वन बगीचा'},
    'garden_subtitle': {'en': 'Each tree represents a completed 5-min focus session.', 'hi': 'हर पेड़ एक पूर्ण 5 मिनट फोकस सत्र दर्शाता है।'},
    'total_trees': {'en': 'Total Trees', 'hi': 'कुल पेड़'},
    'total_focus_time': {'en': 'Total Focus Time', 'hi': 'कुल फोकस समय'},
    'empty_garden': {'en': 'Your garden is empty', 'hi': 'आपका बगीचा खाली है'},
    'empty_garden_sub': {'en': 'Complete focus sessions to grow trees!', 'hi': 'पेड़ उगाने के लिए फोकस सत्र पूरे करें!'},

    // ── Lesson/Quiz ──
    'lesson_complete': {'en': 'Lesson Completed!', 'hi': 'पाठ पूरा हुआ!'},
    'check_answer': {'en': 'Check Answer', 'hi': 'उत्तर जांचें'},
    'excellent': {'en': 'Excellent! Perfect Match', 'hi': 'उत्कृष्ट! सही मिलान'},
    'incorrect': {'en': 'Incorrect Response', 'hi': 'गलत उत्तर'},
    'finish_collect': {'en': 'Finish & Collect Rewards', 'hi': 'समाप्त करें और पुरस्कार लें'},

    // ── Bottom Navigation ──
    'nav_learn': {'en': 'Learn', 'hi': 'सीखें'},
    'nav_dictionary': {'en': 'Dictionary', 'hi': 'शब्दकोश'},
    'nav_practice': {'en': 'Practice', 'hi': 'अभ्यास'},
    'nav_badges': {'en': 'Badges', 'hi': 'बैज'},
    'nav_profile': {'en': 'Profile', 'hi': 'प्रोफ़ाइल'},
  };

  /// Get a localized string by key.
  static String get(String key, LanguageProvider provider) {
    final entry = _strings[key];
    if (entry == null) return key;
    return entry[provider.language] ?? entry['en'] ?? key;
  }

  /// Get by explicit language code.
  static String getByLang(String key, String lang) {
    final entry = _strings[key];
    if (entry == null) return key;
    return entry[lang] ?? entry['en'] ?? key;
  }
}
