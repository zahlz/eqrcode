defmodule EQRCode.SpecTable do
  @type error_correction_level :: :l | :m | :q | :h
  @type version :: 1..40
  @type mode :: :numeric | :alphanumeric | :byte | :kenji | :eci

  def error_correction_level(), do: [:l, :m, :q, :h]

  @mode [
    numeric: 0b0001,
    alphanumeric: 0b0010,
    byte: 0b0100,
    kanji: 0b1000,
    eci: 0b0111
  ]

  @error_corretion_bits [
    l: 0b01,
    m: 0b00,
    q: 0b11,
    h: 0b10
  ]

  @version_information_bits [
    {7, 0b000111110010010100},
    {8, 0b001000010110111100},
    {9, 0b001001101010011001},
    {10, 0b001010010011010011},
    {11, 0b001011101111110110},
    {12, 0b001100011101100010},
    {13, 0b001101100001000111},
    {14, 0b001110011000001101},
    {15, 0b001111100100101000},
    {16, 0b010000101101111000},
    {17, 0b010001010001011101},
    {18, 0b010010101000010111},
    {19, 0b010011010100110010},
    {20, 0b010100100110100110},
    {21, 0b010101011010000011},
    {22, 0b010110100011001001},
    {23, 0b010111011111101100},
    {24, 0b011000111011000100},
    {25, 0b011001000111100001},
    {26, 0b011010111110101011},
    {27, 0b011011000010001110},
    {28, 0b011100110000011010},
    {29, 0b011101001100111111},
    {30, 0b011110110101110101},
    {31, 0b011111001001010000},
    {32, 0b100000100111010101},
    {33, 0b100001011011110000},
    {34, 0b100010100010111010},
    {35, 0b100011011110011111},
    {36, 0b100100101100001011},
    {37, 0b100101010000101110},
    {38, 0b100110101001100100},
    {39, 0b100111010101000001},
    {40, 0b101000110001101001}
  ]

  @spec version_information_bits(version()) :: 1..1_114_111
  def version_information_bits(version)

  for {version, bits} <- @version_information_bits do
    def version_information_bits(unquote(version)), do: unquote(bits)
  end

  @spec error_corretion_bits(error_correction_level()) :: 1..3
  def error_corretion_bits(error_correction_level)

  for {level, bits} <- @error_corretion_bits do
    def error_corretion_bits(unquote(level)), do: unquote(bits)
  end

  def mode_indicator(mode \\ :byte)

  for {mode, mode_indictor} <- @mode do
    def mode_indicator(unquote(mode)), do: unquote(mode_indictor)
  end

  # {:version, :error_correction_level, :mode, :capacity, :character_count_indicator_bits}
  @table [
    {1, :l, :numeric, 41, 10},
    {1, :l, :alphanumeric, 25, 9},
    {1, :l, :byte, 17, 8},
    {1, :l, :kenji, 10, 8},
    {1, :m, :numeric, 34, 10},
    {1, :m, :alphanumeric, 20, 9},
    {1, :m, :byte, 14, 8},
    {1, :m, :kenji, 8, 8},
    {1, :q, :numeric, 27, 10},
    {1, :q, :alphanumeric, 16, 9},
    {1, :q, :byte, 11, 8},
    {1, :q, :kenji, 7, 8},
    {1, :h, :numeric, 17, 10},
    {1, :h, :alphanumeric, 10, 9},
    {1, :h, :byte, 7, 8},
    {1, :h, :kenji, 4, 8},
    {2, :l, :numeric, 77, 10},
    {2, :l, :alphanumeric, 47, 9},
    {2, :l, :byte, 32, 8},
    {2, :l, :kenji, 20, 8},
    {2, :m, :numeric, 63, 10},
    {2, :m, :alphanumeric, 38, 9},
    {2, :m, :byte, 26, 8},
    {2, :m, :kenji, 16, 8},
    {2, :q, :numeric, 48, 10},
    {2, :q, :alphanumeric, 29, 9},
    {2, :q, :byte, 20, 8},
    {2, :q, :kenji, 12, 8},
    {2, :h, :numeric, 34, 10},
    {2, :h, :alphanumeric, 20, 9},
    {2, :h, :byte, 14, 8},
    {2, :h, :kenji, 8, 8},
    {3, :l, :numeric, 127, 10},
    {3, :l, :alphanumeric, 77, 9},
    {3, :l, :byte, 53, 8},
    {3, :l, :kenji, 32, 8},
    {3, :m, :numeric, 101, 10},
    {3, :m, :alphanumeric, 61, 9},
    {3, :m, :byte, 42, 8},
    {3, :m, :kenji, 26, 8},
    {3, :q, :numeric, 77, 10},
    {3, :q, :alphanumeric, 47, 9},
    {3, :q, :byte, 32, 8},
    {3, :q, :kenji, 20, 8},
    {3, :h, :numeric, 58, 10},
    {3, :h, :alphanumeric, 35, 9},
    {3, :h, :byte, 24, 8},
    {3, :h, :kenji, 15, 8},
    {4, :l, :numeric, 187, 10},
    {4, :l, :alphanumeric, 114, 9},
    {4, :l, :byte, 78, 8},
    {4, :l, :kenji, 48, 8},
    {4, :m, :numeric, 149, 10},
    {4, :m, :alphanumeric, 90, 9},
    {4, :m, :byte, 62, 8},
    {4, :m, :kenji, 38, 8},
    {4, :q, :numeric, 111, 10},
    {4, :q, :alphanumeric, 67, 9},
    {4, :q, :byte, 46, 8},
    {4, :q, :kenji, 28, 8},
    {4, :h, :numeric, 82, 10},
    {4, :h, :alphanumeric, 50, 9},
    {4, :h, :byte, 34, 8},
    {4, :h, :kenji, 21, 8},
    {5, :l, :numeric, 255, 10},
    {5, :l, :alphanumeric, 154, 9},
    {5, :l, :byte, 106, 8},
    {5, :l, :kenji, 65, 8},
    {5, :m, :numeric, 202, 10},
    {5, :m, :alphanumeric, 122, 9},
    {5, :m, :byte, 84, 8},
    {5, :m, :kenji, 52, 8},
    {5, :q, :numeric, 144, 10},
    {5, :q, :alphanumeric, 87, 9},
    {5, :q, :byte, 60, 8},
    {5, :q, :kenji, 37, 8},
    {5, :h, :numeric, 106, 10},
    {5, :h, :alphanumeric, 64, 9},
    {5, :h, :byte, 44, 8},
    {5, :h, :kenji, 27, 8},
    {6, :l, :numeric, 322, 10},
    {6, :l, :alphanumeric, 195, 9},
    {6, :l, :byte, 134, 8},
    {6, :l, :kenji, 82, 8},
    {6, :m, :numeric, 255, 10},
    {6, :m, :alphanumeric, 154, 9},
    {6, :m, :byte, 106, 8},
    {6, :m, :kenji, 65, 8},
    {6, :q, :numeric, 178, 10},
    {6, :q, :alphanumeric, 108, 9},
    {6, :q, :byte, 74, 8},
    {6, :q, :kenji, 45, 8},
    {6, :h, :numeric, 139, 10},
    {6, :h, :alphanumeric, 84, 9},
    {6, :h, :byte, 58, 8},
    {6, :h, :kenji, 36, 8},
    {7, :l, :numeric, 370, 10},
    {7, :l, :alphanumeric, 224, 9},
    {7, :l, :byte, 154, 8},
    {7, :l, :kenji, 95, 8},
    {7, :m, :numeric, 293, 10},
    {7, :m, :alphanumeric, 178, 9},
    {7, :m, :byte, 122, 8},
    {7, :m, :kenji, 75, 8},
    {7, :q, :numeric, 207, 10},
    {7, :q, :alphanumeric, 125, 9},
    {7, :q, :byte, 86, 8},
    {7, :q, :kenji, 53, 8},
    {7, :h, :numeric, 154, 10},
    {7, :h, :alphanumeric, 93, 9},
    {7, :h, :byte, 64, 8},
    {7, :h, :kenji, 39, 8},
    {8, :l, :numeric, 461, 10},
    {8, :l, :alphanumeric, 279, 9},
    {8, :l, :byte, 192, 8},
    {8, :l, :kenji, 118, 8},
    {8, :m, :numeric, 365, 10},
    {8, :m, :alphanumeric, 221, 9},
    {8, :m, :byte, 152, 8},
    {8, :m, :kenji, 93, 8},
    {8, :q, :numeric, 259, 10},
    {8, :q, :alphanumeric, 157, 9},
    {8, :q, :byte, 108, 8},
    {8, :q, :kenji, 66, 8},
    {8, :h, :numeric, 202, 10},
    {8, :h, :alphanumeric, 122, 9},
    {8, :h, :byte, 84, 8},
    {8, :h, :kenji, 52, 8},
    {9, :l, :numeric, 552, 10},
    {9, :l, :alphanumeric, 335, 9},
    {9, :l, :byte, 230, 8},
    {9, :l, :kenji, 141, 8},
    {9, :m, :numeric, 432, 10},
    {9, :m, :alphanumeric, 262, 9},
    {9, :m, :byte, 180, 8},
    {9, :m, :kenji, 111, 8},
    {9, :q, :numeric, 312, 10},
    {9, :q, :alphanumeric, 189, 9},
    {9, :q, :byte, 130, 8},
    {9, :q, :kenji, 80, 8},
    {9, :h, :numeric, 235, 10},
    {9, :h, :alphanumeric, 143, 9},
    {9, :h, :byte, 98, 8},
    {9, :h, :kenji, 60, 8},
    {10, :l, :numeric, 652, 12},
    {10, :l, :alphanumeric, 395, 11},
    {10, :l, :byte, 271, 16},
    {10, :l, :kenji, 167, 10},
    {10, :m, :numeric, 513, 12},
    {10, :m, :alphanumeric, 311, 11},
    {10, :m, :byte, 213, 16},
    {10, :m, :kenji, 131, 10},
    {10, :q, :numeric, 364, 12},
    {10, :q, :alphanumeric, 221, 11},
    {10, :q, :byte, 151, 16},
    {10, :q, :kenji, 93, 10},
    {10, :h, :numeric, 288, 12},
    {10, :h, :alphanumeric, 174, 11},
    {10, :h, :byte, 119, 16},
    {10, :h, :kenji, 74, 10},
    {11, :l, :numeric, 772, 12},
    {11, :l, :alphanumeric, 468, 11},
    {11, :l, :byte, 321, 16},
    {11, :l, :kenji, 198, 10},
    {11, :m, :numeric, 604, 12},
    {11, :m, :alphanumeric, 366, 11},
    {11, :m, :byte, 251, 16},
    {11, :m, :kenji, 155, 10},
    {11, :q, :numeric, 427, 12},
    {11, :q, :alphanumeric, 259, 11},
    {11, :q, :byte, 177, 16},
    {11, :q, :kenji, 109, 10},
    {11, :h, :numeric, 331, 12},
    {11, :h, :alphanumeric, 200, 11},
    {11, :h, :byte, 137, 16},
    {11, :h, :kenji, 85, 10},
    {12, :l, :numeric, 883, 12},
    {12, :l, :alphanumeric, 535, 11},
    {12, :l, :byte, 367, 16},
    {12, :l, :kenji, 226, 10},
    {12, :m, :numeric, 691, 12},
    {12, :m, :alphanumeric, 419, 11},
    {12, :m, :byte, 287, 16},
    {12, :m, :kenji, 177, 10},
    {12, :q, :numeric, 489, 12},
    {12, :q, :alphanumeric, 296, 11},
    {12, :q, :byte, 203, 16},
    {12, :q, :kenji, 125, 10},
    {12, :h, :numeric, 374, 12},
    {12, :h, :alphanumeric, 227, 11},
    {12, :h, :byte, 155, 16},
    {12, :h, :kenji, 96, 10},
    {13, :l, :numeric, 1022, 12},
    {13, :l, :alphanumeric, 619, 11},
    {13, :l, :byte, 425, 16},
    {13, :l, :kenji, 262, 10},
    {13, :m, :numeric, 796, 12},
    {13, :m, :alphanumeric, 483, 11},
    {13, :m, :byte, 331, 16},
    {13, :m, :kenji, 204, 10},
    {13, :q, :numeric, 580, 12},
    {13, :q, :alphanumeric, 352, 11},
    {13, :q, :byte, 241, 16},
    {13, :q, :kenji, 149, 10},
    {13, :h, :numeric, 427, 12},
    {13, :h, :alphanumeric, 259, 11},
    {13, :h, :byte, 177, 16},
    {13, :h, :kenji, 109, 10},
    {14, :l, :numeric, 1101, 12},
    {14, :l, :alphanumeric, 667, 11},
    {14, :l, :byte, 458, 16},
    {14, :l, :kenji, 282, 10},
    {14, :m, :numeric, 871, 12},
    {14, :m, :alphanumeric, 528, 11},
    {14, :m, :byte, 362, 16},
    {14, :m, :kenji, 223, 10},
    {14, :q, :numeric, 621, 12},
    {14, :q, :alphanumeric, 376, 11},
    {14, :q, :byte, 258, 16},
    {14, :q, :kenji, 159, 10},
    {14, :h, :numeric, 468, 12},
    {14, :h, :alphanumeric, 283, 11},
    {14, :h, :byte, 194, 16},
    {14, :h, :kenji, 120, 10},
    {15, :l, :numeric, 1250, 12},
    {15, :l, :alphanumeric, 758, 11},
    {15, :l, :byte, 520, 16},
    {15, :l, :kenji, 320, 10},
    {15, :m, :numeric, 991, 12},
    {15, :m, :alphanumeric, 600, 11},
    {15, :m, :byte, 412, 16},
    {15, :m, :kenji, 254, 10},
    {15, :q, :numeric, 703, 12},
    {15, :q, :alphanumeric, 426, 11},
    {15, :q, :byte, 292, 16},
    {15, :q, :kenji, 180, 10},
    {15, :h, :numeric, 530, 12},
    {15, :h, :alphanumeric, 321, 11},
    {15, :h, :byte, 220, 16},
    {15, :h, :kenji, 136, 10},
    {16, :l, :numeric, 1408, 12},
    {16, :l, :alphanumeric, 854, 11},
    {16, :l, :byte, 586, 16},
    {16, :l, :kenji, 361, 10},
    {16, :m, :numeric, 1082, 12},
    {16, :m, :alphanumeric, 656, 11},
    {16, :m, :byte, 450, 16},
    {16, :m, :kenji, 277, 10},
    {16, :q, :numeric, 775, 12},
    {16, :q, :alphanumeric, 470, 11},
    {16, :q, :byte, 322, 16},
    {16, :q, :kenji, 198, 10},
    {16, :h, :numeric, 602, 12},
    {16, :h, :alphanumeric, 365, 11},
    {16, :h, :byte, 250, 16},
    {16, :h, :kenji, 154, 10},
    {17, :l, :numeric, 1548, 12},
    {17, :l, :alphanumeric, 938, 11},
    {17, :l, :byte, 644, 16},
    {17, :l, :kenji, 397, 10},
    {17, :m, :numeric, 1212, 12},
    {17, :m, :alphanumeric, 734, 11},
    {17, :m, :byte, 504, 16},
    {17, :m, :kenji, 310, 10},
    {17, :q, :numeric, 876, 12},
    {17, :q, :alphanumeric, 531, 11},
    {17, :q, :byte, 364, 16},
    {17, :q, :kenji, 224, 10},
    {17, :h, :numeric, 674, 12},
    {17, :h, :alphanumeric, 408, 11},
    {17, :h, :byte, 280, 16},
    {17, :h, :kenji, 173, 10},
    {18, :l, :numeric, 1725, 12},
    {18, :l, :alphanumeric, 1046, 11},
    {18, :l, :byte, 718, 16},
    {18, :l, :kenji, 442, 10},
    {18, :m, :numeric, 1346, 12},
    {18, :m, :alphanumeric, 816, 11},
    {18, :m, :byte, 560, 16},
    {18, :m, :kenji, 345, 10},
    {18, :q, :numeric, 948, 12},
    {18, :q, :alphanumeric, 574, 11},
    {18, :q, :byte, 394, 16},
    {18, :q, :kenji, 243, 10},
    {18, :h, :numeric, 746, 12},
    {18, :h, :alphanumeric, 452, 11},
    {18, :h, :byte, 310, 16},
    {18, :h, :kenji, 191, 10},
    {19, :l, :numeric, 1903, 12},
    {19, :l, :alphanumeric, 1153, 11},
    {19, :l, :byte, 792, 16},
    {19, :l, :kenji, 488, 10},
    {19, :m, :numeric, 1500, 12},
    {19, :m, :alphanumeric, 909, 11},
    {19, :m, :byte, 624, 16},
    {19, :m, :kenji, 384, 10},
    {19, :q, :numeric, 1063, 12},
    {19, :q, :alphanumeric, 644, 11},
    {19, :q, :byte, 442, 16},
    {19, :q, :kenji, 272, 10},
    {19, :h, :numeric, 813, 12},
    {19, :h, :alphanumeric, 493, 11},
    {19, :h, :byte, 338, 16},
    {19, :h, :kenji, 208, 10},
    {20, :l, :numeric, 2061, 12},
    {20, :l, :alphanumeric, 1249, 11},
    {20, :l, :byte, 858, 16},
    {20, :l, :kenji, 528, 10},
    {20, :m, :numeric, 1600, 12},
    {20, :m, :alphanumeric, 970, 11},
    {20, :m, :byte, 666, 16},
    {20, :m, :kenji, 410, 10},
    {20, :q, :numeric, 1159, 12},
    {20, :q, :alphanumeric, 702, 11},
    {20, :q, :byte, 482, 16},
    {20, :q, :kenji, 297, 10},
    {20, :h, :numeric, 919, 12},
    {20, :h, :alphanumeric, 557, 11},
    {20, :h, :byte, 382, 16},
    {20, :h, :kenji, 235, 10},
    {21, :l, :numeric, 2232, 12},
    {21, :l, :alphanumeric, 1352, 11},
    {21, :l, :byte, 929, 16},
    {21, :l, :kenji, 572, 10},
    {21, :m, :numeric, 1708, 12},
    {21, :m, :alphanumeric, 1035, 11},
    {21, :m, :byte, 711, 16},
    {21, :m, :kenji, 438, 10},
    {21, :q, :numeric, 1224, 12},
    {21, :q, :alphanumeric, 742, 11},
    {21, :q, :byte, 509, 16},
    {21, :q, :kenji, 314, 10},
    {21, :h, :numeric, 969, 12},
    {21, :h, :alphanumeric, 587, 11},
    {21, :h, :byte, 403, 16},
    {21, :h, :kenji, 248, 10},
    {22, :l, :numeric, 2409, 12},
    {22, :l, :alphanumeric, 1460, 11},
    {22, :l, :byte, 1003, 16},
    {22, :l, :kenji, 618, 10},
    {22, :m, :numeric, 1872, 12},
    {22, :m, :alphanumeric, 1134, 11},
    {22, :m, :byte, 779, 16},
    {22, :m, :kenji, 480, 10},
    {22, :q, :numeric, 1358, 12},
    {22, :q, :alphanumeric, 823, 11},
    {22, :q, :byte, 565, 16},
    {22, :q, :kenji, 348, 10},
    {22, :h, :numeric, 1056, 12},
    {22, :h, :alphanumeric, 640, 11},
    {22, :h, :byte, 439, 16},
    {22, :h, :kenji, 270, 10},
    {23, :l, :numeric, 2620, 12},
    {23, :l, :alphanumeric, 1588, 11},
    {23, :l, :byte, 1091, 16},
    {23, :l, :kenji, 672, 10},
    {23, :m, :numeric, 2059, 12},
    {23, :m, :alphanumeric, 1248, 11},
    {23, :m, :byte, 857, 16},
    {23, :m, :kenji, 528, 10},
    {23, :q, :numeric, 1468, 12},
    {23, :q, :alphanumeric, 890, 11},
    {23, :q, :byte, 611, 16},
    {23, :q, :kenji, 376, 10},
    {23, :h, :numeric, 1108, 12},
    {23, :h, :alphanumeric, 672, 11},
    {23, :h, :byte, 461, 16},
    {23, :h, :kenji, 284, 10},
    {24, :l, :numeric, 2812, 12},
    {24, :l, :alphanumeric, 1704, 11},
    {24, :l, :byte, 1171, 16},
    {24, :l, :kenji, 721, 10},
    {24, :m, :numeric, 2188, 12},
    {24, :m, :alphanumeric, 1326, 11},
    {24, :m, :byte, 911, 16},
    {24, :m, :kenji, 561, 10},
    {24, :q, :numeric, 1588, 12},
    {24, :q, :alphanumeric, 963, 11},
    {24, :q, :byte, 661, 16},
    {24, :q, :kenji, 407, 10},
    {24, :h, :numeric, 1228, 12},
    {24, :h, :alphanumeric, 744, 11},
    {24, :h, :byte, 511, 16},
    {24, :h, :kenji, 315, 10},
    {25, :l, :numeric, 3057, 12},
    {25, :l, :alphanumeric, 1853, 11},
    {25, :l, :byte, 1273, 16},
    {25, :l, :kenji, 784, 10},
    {25, :m, :numeric, 2395, 12},
    {25, :m, :alphanumeric, 1451, 11},
    {25, :m, :byte, 997, 16},
    {25, :m, :kenji, 614, 10},
    {25, :q, :numeric, 1718, 12},
    {25, :q, :alphanumeric, 1041, 11},
    {25, :q, :byte, 715, 16},
    {25, :q, :kenji, 440, 10},
    {25, :h, :numeric, 1286, 12},
    {25, :h, :alphanumeric, 779, 11},
    {25, :h, :byte, 535, 16},
    {25, :h, :kenji, 330, 10},
    {26, :l, :numeric, 3283, 12},
    {26, :l, :alphanumeric, 1990, 11},
    {26, :l, :byte, 1367, 16},
    {26, :l, :kenji, 842, 10},
    {26, :m, :numeric, 2544, 12},
    {26, :m, :alphanumeric, 1542, 11},
    {26, :m, :byte, 1059, 16},
    {26, :m, :kenji, 652, 10},
    {26, :q, :numeric, 1804, 12},
    {26, :q, :alphanumeric, 1094, 11},
    {26, :q, :byte, 751, 16},
    {26, :q, :kenji, 462, 10},
    {26, :h, :numeric, 1425, 12},
    {26, :h, :alphanumeric, 864, 11},
    {26, :h, :byte, 593, 16},
    {26, :h, :kenji, 365, 10},
    {27, :l, :numeric, 3517, 14},
    {27, :l, :alphanumeric, 2132, 13},
    {27, :l, :byte, 1465, 16},
    {27, :l, :kenji, 902, 12},
    {27, :m, :numeric, 2701, 14},
    {27, :m, :alphanumeric, 1637, 13},
    {27, :m, :byte, 1125, 16},
    {27, :m, :kenji, 692, 12},
    {27, :q, :numeric, 1933, 14},
    {27, :q, :alphanumeric, 1172, 13},
    {27, :q, :byte, 805, 16},
    {27, :q, :kenji, 496, 12},
    {27, :h, :numeric, 1501, 14},
    {27, :h, :alphanumeric, 910, 13},
    {27, :h, :byte, 625, 16},
    {27, :h, :kenji, 385, 12},
    {28, :l, :numeric, 3669, 14},
    {28, :l, :alphanumeric, 2223, 13},
    {28, :l, :byte, 1528, 16},
    {28, :l, :kenji, 940, 12},
    {28, :m, :numeric, 2857, 14},
    {28, :m, :alphanumeric, 1732, 13},
    {28, :m, :byte, 1190, 16},
    {28, :m, :kenji, 732, 12},
    {28, :q, :numeric, 2085, 14},
    {28, :q, :alphanumeric, 1263, 13},
    {28, :q, :byte, 868, 16},
    {28, :q, :kenji, 534, 12},
    {28, :h, :numeric, 1581, 14},
    {28, :h, :alphanumeric, 958, 13},
    {28, :h, :byte, 658, 16},
    {28, :h, :kenji, 405, 12},
    {29, :l, :numeric, 3909, 14},
    {29, :l, :alphanumeric, 2369, 13},
    {29, :l, :byte, 1628, 16},
    {29, :l, :kenji, 1002, 12},
    {29, :m, :numeric, 3035, 14},
    {29, :m, :alphanumeric, 1839, 13},
    {29, :m, :byte, 1264, 16},
    {29, :m, :kenji, 778, 12},
    {29, :q, :numeric, 2181, 14},
    {29, :q, :alphanumeric, 1322, 13},
    {29, :q, :byte, 908, 16},
    {29, :q, :kenji, 559, 12},
    {29, :h, :numeric, 1677, 14},
    {29, :h, :alphanumeric, 1016, 13},
    {29, :h, :byte, 698, 16},
    {29, :h, :kenji, 430, 12},
    {30, :l, :numeric, 4158, 14},
    {30, :l, :alphanumeric, 2520, 13},
    {30, :l, :byte, 1732, 16},
    {30, :l, :kenji, 1066, 12},
    {30, :m, :numeric, 3289, 14},
    {30, :m, :alphanumeric, 1994, 13},
    {30, :m, :byte, 1370, 16},
    {30, :m, :kenji, 843, 12},
    {30, :q, :numeric, 2358, 14},
    {30, :q, :alphanumeric, 1429, 13},
    {30, :q, :byte, 982, 16},
    {30, :q, :kenji, 604, 12},
    {30, :h, :numeric, 1782, 14},
    {30, :h, :alphanumeric, 1080, 13},
    {30, :h, :byte, 742, 16},
    {30, :h, :kenji, 457, 12},
    {31, :l, :numeric, 4417, 14},
    {31, :l, :alphanumeric, 2677, 13},
    {31, :l, :byte, 1840, 16},
    {31, :l, :kenji, 1132, 12},
    {31, :m, :numeric, 3486, 14},
    {31, :m, :alphanumeric, 2113, 13},
    {31, :m, :byte, 1452, 16},
    {31, :m, :kenji, 894, 12},
    {31, :q, :numeric, 2473, 14},
    {31, :q, :alphanumeric, 1499, 13},
    {31, :q, :byte, 1030, 16},
    {31, :q, :kenji, 634, 12},
    {31, :h, :numeric, 1897, 14},
    {31, :h, :alphanumeric, 1150, 13},
    {31, :h, :byte, 790, 16},
    {31, :h, :kenji, 486, 12},
    {32, :l, :numeric, 4686, 14},
    {32, :l, :alphanumeric, 2840, 13},
    {32, :l, :byte, 1952, 16},
    {32, :l, :kenji, 1201, 12},
    {32, :m, :numeric, 3693, 14},
    {32, :m, :alphanumeric, 2238, 13},
    {32, :m, :byte, 1538, 16},
    {32, :m, :kenji, 947, 12},
    {32, :q, :numeric, 2670, 14},
    {32, :q, :alphanumeric, 1618, 13},
    {32, :q, :byte, 1112, 16},
    {32, :q, :kenji, 684, 12},
    {32, :h, :numeric, 2022, 14},
    {32, :h, :alphanumeric, 1226, 13},
    {32, :h, :byte, 842, 16},
    {32, :h, :kenji, 518, 12},
    {33, :l, :numeric, 4965, 14},
    {33, :l, :alphanumeric, 3009, 13},
    {33, :l, :byte, 2068, 16},
    {33, :l, :kenji, 1273, 12},
    {33, :m, :numeric, 3909, 14},
    {33, :m, :alphanumeric, 2369, 13},
    {33, :m, :byte, 1628, 16},
    {33, :m, :kenji, 1002, 12},
    {33, :q, :numeric, 2805, 14},
    {33, :q, :alphanumeric, 1700, 13},
    {33, :q, :byte, 1168, 16},
    {33, :q, :kenji, 719, 12},
    {33, :h, :numeric, 2157, 14},
    {33, :h, :alphanumeric, 1307, 13},
    {33, :h, :byte, 898, 16},
    {33, :h, :kenji, 553, 12},
    {34, :l, :numeric, 5253, 14},
    {34, :l, :alphanumeric, 3183, 13},
    {34, :l, :byte, 2188, 16},
    {34, :l, :kenji, 1347, 12},
    {34, :m, :numeric, 4134, 14},
    {34, :m, :alphanumeric, 2506, 13},
    {34, :m, :byte, 1722, 16},
    {34, :m, :kenji, 1060, 12},
    {34, :q, :numeric, 2949, 14},
    {34, :q, :alphanumeric, 1787, 13},
    {34, :q, :byte, 1228, 16},
    {34, :q, :kenji, 756, 12},
    {34, :h, :numeric, 2301, 14},
    {34, :h, :alphanumeric, 1394, 13},
    {34, :h, :byte, 958, 16},
    {34, :h, :kenji, 590, 12},
    {35, :l, :numeric, 5529, 14},
    {35, :l, :alphanumeric, 3351, 13},
    {35, :l, :byte, 2303, 16},
    {35, :l, :kenji, 1417, 12},
    {35, :m, :numeric, 4343, 14},
    {35, :m, :alphanumeric, 2632, 13},
    {35, :m, :byte, 1809, 16},
    {35, :m, :kenji, 1113, 12},
    {35, :q, :numeric, 3081, 14},
    {35, :q, :alphanumeric, 1867, 13},
    {35, :q, :byte, 1283, 16},
    {35, :q, :kenji, 790, 12},
    {35, :h, :numeric, 2361, 14},
    {35, :h, :alphanumeric, 1431, 13},
    {35, :h, :byte, 983, 16},
    {35, :h, :kenji, 605, 12},
    {36, :l, :numeric, 5836, 14},
    {36, :l, :alphanumeric, 3537, 13},
    {36, :l, :byte, 2431, 16},
    {36, :l, :kenji, 1496, 12},
    {36, :m, :numeric, 4588, 14},
    {36, :m, :alphanumeric, 2780, 13},
    {36, :m, :byte, 1911, 16},
    {36, :m, :kenji, 1176, 12},
    {36, :q, :numeric, 3244, 14},
    {36, :q, :alphanumeric, 1966, 13},
    {36, :q, :byte, 1351, 16},
    {36, :q, :kenji, 832, 12},
    {36, :h, :numeric, 2524, 14},
    {36, :h, :alphanumeric, 1530, 13},
    {36, :h, :byte, 1051, 16},
    {36, :h, :kenji, 647, 12},
    {37, :l, :numeric, 6153, 14},
    {37, :l, :alphanumeric, 3729, 13},
    {37, :l, :byte, 2563, 16},
    {37, :l, :kenji, 1577, 12},
    {37, :m, :numeric, 4775, 14},
    {37, :m, :alphanumeric, 2894, 13},
    {37, :m, :byte, 1989, 16},
    {37, :m, :kenji, 1224, 12},
    {37, :q, :numeric, 3417, 14},
    {37, :q, :alphanumeric, 2071, 13},
    {37, :q, :byte, 1423, 16},
    {37, :q, :kenji, 876, 12},
    {37, :h, :numeric, 2625, 14},
    {37, :h, :alphanumeric, 1591, 13},
    {37, :h, :byte, 1093, 16},
    {37, :h, :kenji, 673, 12},
    {38, :l, :numeric, 6479, 14},
    {38, :l, :alphanumeric, 3927, 13},
    {38, :l, :byte, 2699, 16},
    {38, :l, :kenji, 1661, 12},
    {38, :m, :numeric, 5039, 14},
    {38, :m, :alphanumeric, 3054, 13},
    {38, :m, :byte, 2099, 16},
    {38, :m, :kenji, 1292, 12},
    {38, :q, :numeric, 3599, 14},
    {38, :q, :alphanumeric, 2181, 13},
    {38, :q, :byte, 1499, 16},
    {38, :q, :kenji, 923, 12},
    {38, :h, :numeric, 2735, 14},
    {38, :h, :alphanumeric, 1658, 13},
    {38, :h, :byte, 1139, 16},
    {38, :h, :kenji, 701, 12},
    {39, :l, :numeric, 6743, 14},
    {39, :l, :alphanumeric, 4087, 13},
    {39, :l, :byte, 2809, 16},
    {39, :l, :kenji, 1729, 12},
    {39, :m, :numeric, 5313, 14},
    {39, :m, :alphanumeric, 3220, 13},
    {39, :m, :byte, 2213, 16},
    {39, :m, :kenji, 1362, 12},
    {39, :q, :numeric, 3791, 14},
    {39, :q, :alphanumeric, 2298, 13},
    {39, :q, :byte, 1579, 16},
    {39, :q, :kenji, 972, 12},
    {39, :h, :numeric, 2927, 14},
    {39, :h, :alphanumeric, 1774, 13},
    {39, :h, :byte, 1219, 16},
    {39, :h, :kenji, 750, 12},
    {40, :l, :numeric, 7089, 14},
    {40, :l, :alphanumeric, 4296, 13},
    {40, :l, :byte, 2953, 16},
    {40, :l, :kenji, 1817, 12},
    {40, :m, :numeric, 5596, 14},
    {40, :m, :alphanumeric, 3391, 13},
    {40, :m, :byte, 2331, 16},
    {40, :m, :kenji, 1435, 12},
    {40, :q, :numeric, 3993, 14},
    {40, :q, :alphanumeric, 2420, 13},
    {40, :q, :byte, 1663, 16},
    {40, :q, :kenji, 1024, 12},
    {40, :h, :numeric, 3057, 14},
    {40, :h, :alphanumeric, 1852, 13},
    {40, :h, :byte, 1273, 16},
    {40, :h, :kenji, 784, 12}
  ]

  @ec_levels @table |> Enum.map(&elem(&1, 1)) |> Enum.uniq()
  @modes @table |> Enum.map(&elem(&1, 2)) |> Enum.uniq()

  @spec find_version(non_neg_integer(), error_correction_level(), mode()) :: {:error, :no_version_found} | {:ok, version()}
  def find_version(bin_len, ec_level \\ :h, mode \\ :byte)

  for ec_level <- @ec_levels,
      mode <- @modes,
      {version, _, _, cap, _} <-
        Enum.filter(@table, &match?({_, ^ec_level, ^mode, _, _}, &1)) |> Enum.sort_by(&elem(&1, 3)) do
    def find_version(bin_len, unquote(ec_level), unquote(mode)) when bin_len <= unquote(cap),
      do: {:ok, unquote(version)}
  end

  def find_version(_bin_len, _ec_level, _mode), do: {:error, :no_version_found}

  @spec character_count_indicator_bits(version(), error_correction_level(), mode()) :: non_neg_integer()
  def character_count_indicator_bits(version, ec_level, mode \\ :byte)

  for {version, ec_level, mode, _, cci_len} <- @table do
    def character_count_indicator_bits(unquote(version), unquote(ec_level), unquote(mode)), do: unquote(cci_len)
  end

  def character_count_indicator_bits(_version, _ec_level, _mode), do: 0

  # {:version, :error_correction_level, :ec_codewords_per_block, :group1_block_len, :group1_codewords_per_block, :group2_block_len, :group2_codewords_per_block}
  @error_correction_table [
    {1, :l, 7, 1, 19, 0, 0},
    {1, :m, 10, 1, 16, 0, 0},
    {1, :q, 13, 1, 13, 0, 0},
    {1, :h, 17, 1, 9, 0, 0},
    {2, :l, 10, 1, 34, 0, 0},
    {2, :m, 16, 1, 28, 0, 0},
    {2, :q, 22, 1, 22, 0, 0},
    {2, :h, 28, 1, 16, 0, 0},
    {3, :l, 15, 1, 55, 0, 0},
    {3, :m, 26, 1, 44, 0, 0},
    {3, :q, 18, 2, 17, 0, 0},
    {3, :h, 22, 2, 13, 0, 0},
    {4, :l, 20, 1, 80, 0, 0},
    {4, :m, 18, 2, 32, 0, 0},
    {4, :q, 26, 2, 24, 0, 0},
    {4, :h, 16, 4, 9, 0, 0},
    {5, :l, 26, 1, 108, 0, 0},
    {5, :m, 24, 2, 43, 0, 0},
    {5, :q, 18, 2, 15, 2, 16},
    {5, :h, 22, 2, 11, 2, 12},
    {6, :l, 18, 2, 68, 0, 0},
    {6, :m, 16, 4, 27, 0, 0},
    {6, :q, 24, 4, 19, 0, 0},
    {6, :h, 28, 4, 15, 0, 0},
    {7, :l, 20, 2, 78, 0, 0},
    {7, :m, 18, 4, 31, 0, 0},
    {7, :q, 18, 2, 14, 4, 15},
    {7, :h, 26, 4, 13, 1, 14},
    {8, :l, 24, 2, 97, 0, 0},
    {8, :m, 22, 2, 38, 2, 39},
    {8, :q, 22, 4, 18, 2, 19},
    {8, :h, 26, 4, 14, 2, 15},
    {9, :l, 30, 2, 116, 0, 0},
    {9, :m, 22, 3, 36, 2, 37},
    {9, :q, 20, 4, 16, 4, 17},
    {9, :h, 24, 4, 12, 4, 13},
    {10, :l, 18, 2, 68, 2, 69},
    {10, :m, 26, 4, 43, 1, 44},
    {10, :q, 24, 6, 19, 2, 20},
    {10, :h, 28, 6, 15, 2, 16},
    {11, :l, 20, 4, 81, 0, 0},
    {11, :m, 30, 1, 50, 4, 51},
    {11, :q, 28, 4, 22, 4, 23},
    {11, :h, 24, 3, 12, 8, 13},
    {12, :l, 24, 2, 92, 2, 93},
    {12, :m, 22, 6, 36, 2, 37},
    {12, :q, 26, 4, 20, 6, 21},
    {12, :h, 28, 7, 14, 4, 15},
    {13, :l, 26, 4, 107, 0, 0},
    {13, :m, 22, 8, 37, 1, 38},
    {13, :q, 24, 8, 20, 4, 21},
    {13, :h, 22, 12, 11, 4, 12},
    {14, :l, 30, 3, 115, 1, 116},
    {14, :m, 24, 4, 40, 5, 41},
    {14, :q, 20, 11, 16, 5, 17},
    {14, :h, 24, 11, 12, 5, 13},
    {15, :l, 22, 5, 87, 1, 88},
    {15, :m, 24, 5, 41, 5, 42},
    {15, :q, 30, 5, 24, 7, 25},
    {15, :h, 24, 11, 12, 7, 13},
    {16, :l, 24, 5, 98, 1, 99},
    {16, :m, 28, 7, 45, 3, 46},
    {16, :q, 24, 15, 19, 2, 20},
    {16, :h, 30, 3, 15, 13, 16},
    {17, :l, 28, 1, 107, 5, 108},
    {17, :m, 28, 10, 46, 1, 47},
    {17, :q, 28, 1, 22, 15, 23},
    {17, :h, 28, 2, 14, 17, 15},
    {18, :l, 30, 5, 120, 1, 121},
    {18, :m, 26, 9, 43, 4, 44},
    {18, :q, 28, 17, 22, 1, 23},
    {18, :h, 28, 2, 14, 19, 15},
    {19, :l, 28, 3, 113, 4, 114},
    {19, :m, 26, 3, 44, 11, 45},
    {19, :q, 26, 17, 21, 4, 22},
    {19, :h, 26, 9, 13, 16, 14},
    {20, :l, 28, 3, 107, 5, 108},
    {20, :m, 26, 3, 41, 13, 42},
    {20, :q, 30, 15, 24, 5, 25},
    {20, :h, 28, 15, 15, 10, 16},
    {21, :l, 28, 4, 116, 4, 117},
    {21, :m, 26, 17, 42, 0, 0},
    {21, :q, 28, 17, 22, 6, 23},
    {21, :h, 30, 19, 16, 6, 17},
    {22, :l, 28, 2, 111, 7, 112},
    {22, :m, 28, 17, 46, 0, 0},
    {22, :q, 30, 7, 24, 16, 25},
    {22, :h, 24, 34, 13, 0, 0},
    {23, :l, 30, 4, 121, 5, 122},
    {23, :m, 28, 4, 47, 14, 48},
    {23, :q, 30, 11, 24, 14, 25},
    {23, :h, 30, 16, 15, 14, 16},
    {24, :l, 30, 6, 117, 4, 118},
    {24, :m, 28, 6, 45, 14, 46},
    {24, :q, 30, 11, 24, 16, 25},
    {24, :h, 30, 30, 16, 2, 17},
    {25, :l, 26, 8, 106, 4, 107},
    {25, :m, 28, 8, 47, 13, 48},
    {25, :q, 30, 7, 24, 22, 25},
    {25, :h, 30, 22, 15, 13, 16},
    {26, :l, 28, 10, 114, 2, 115},
    {26, :m, 28, 19, 46, 4, 47},
    {26, :q, 28, 28, 22, 6, 23},
    {26, :h, 30, 33, 16, 4, 17},
    {27, :l, 30, 8, 122, 4, 123},
    {27, :m, 28, 22, 45, 3, 46},
    {27, :q, 30, 8, 23, 26, 24},
    {27, :h, 30, 12, 15, 28, 16},
    {28, :l, 30, 3, 117, 10, 118},
    {28, :m, 28, 3, 45, 23, 46},
    {28, :q, 30, 4, 24, 31, 25},
    {28, :h, 30, 11, 15, 31, 16},
    {29, :l, 30, 7, 116, 7, 117},
    {29, :m, 28, 21, 45, 7, 46},
    {29, :q, 30, 1, 23, 37, 24},
    {29, :h, 30, 19, 15, 26, 16},
    {30, :l, 30, 5, 115, 10, 116},
    {30, :m, 28, 19, 47, 10, 48},
    {30, :q, 30, 15, 24, 25, 25},
    {30, :h, 30, 23, 15, 25, 16},
    {31, :l, 30, 13, 115, 3, 116},
    {31, :m, 28, 2, 46, 29, 47},
    {31, :q, 30, 42, 24, 1, 25},
    {31, :h, 30, 23, 15, 28, 16},
    {32, :l, 30, 17, 115, 0, 0},
    {32, :m, 28, 10, 46, 23, 47},
    {32, :q, 30, 10, 24, 35, 25},
    {32, :h, 30, 19, 15, 35, 16},
    {33, :l, 30, 17, 115, 1, 116},
    {33, :m, 28, 14, 46, 21, 47},
    {33, :q, 30, 29, 24, 19, 25},
    {33, :h, 30, 11, 15, 46, 16},
    {34, :l, 30, 13, 115, 6, 116},
    {34, :m, 28, 14, 46, 23, 47},
    {34, :q, 30, 44, 24, 7, 25},
    {34, :h, 30, 59, 16, 1, 17},
    {35, :l, 30, 12, 121, 7, 122},
    {35, :m, 28, 12, 47, 26, 48},
    {35, :q, 30, 39, 24, 14, 25},
    {35, :h, 30, 22, 15, 41, 16},
    {36, :l, 30, 6, 121, 14, 122},
    {36, :m, 28, 6, 47, 34, 48},
    {36, :q, 30, 46, 24, 10, 25},
    {36, :h, 30, 2, 15, 64, 16},
    {37, :l, 30, 17, 122, 4, 123},
    {37, :m, 28, 29, 46, 14, 47},
    {37, :q, 30, 49, 24, 10, 25},
    {37, :h, 30, 24, 15, 46, 16},
    {38, :l, 30, 4, 122, 18, 123},
    {38, :m, 28, 13, 46, 32, 47},
    {38, :q, 30, 48, 24, 14, 25},
    {38, :h, 30, 42, 15, 32, 16},
    {39, :l, 30, 20, 117, 4, 118},
    {39, :m, 28, 40, 47, 7, 48},
    {39, :q, 30, 43, 24, 22, 25},
    {39, :h, 30, 10, 15, 67, 16},
    {40, :l, 30, 19, 118, 6, 119},
    {40, :m, 28, 18, 47, 31, 48},
    {40, :q, 30, 34, 24, 34, 25},
    {40, :h, 30, 20, 15, 61, 16}
  ]

  @spec code_words_len(version(), error_correction_level()) :: non_neg_integer()
  def code_words_len(version, error_correction_level)

  for {version, error_correction_level, _, g1_blocks, g1_codewords, g2_blocks, g2_codewords} <- @error_correction_table do
    def code_words_len(unquote(version), unquote(error_correction_level)), do: unquote(g1_blocks * g1_codewords + g2_blocks * g2_codewords)
  end

  def code_words_len(_version, _error_correction_level), do: 0

  @spec ec_codewords_per_block(version(), error_correction_level()) :: non_neg_integer()
  def ec_codewords_per_block(version, error_correction_level)

  for {version, error_correction_level, ec_codewords_per_block, _, _, _, _} <- @error_correction_table do
    def ec_codewords_per_block(unquote(version), unquote(error_correction_level)), do: unquote(ec_codewords_per_block)
  end

  def ec_codewords_per_block(_version, _error_correction_level), do: 0

  @spec group1_block_len(version(), error_correction_level()) :: non_neg_integer()
  def group1_block_len(version, error_correction_level)

  for {version, error_correction_level, _, group1_block_len, _, _, _} <- @error_correction_table do
    def group1_block_len(unquote(version), unquote(error_correction_level)), do: unquote(group1_block_len)
  end

  def group1_block_len(_version, _error_correction_level), do: 0

  @spec group1_codewords_per_block(version(), error_correction_level()) :: non_neg_integer()
  def group1_codewords_per_block(version, error_correction_level)

  for {version, error_correction_level, _, _, group1_codewords_per_block, _, _} <- @error_correction_table do
    def group1_codewords_per_block(unquote(version), unquote(error_correction_level)), do: unquote(group1_codewords_per_block)
  end

  def group1_codewords_per_block(_version, _error_correction_level), do: 0

  @spec group2_block_len(version(), error_correction_level()) :: non_neg_integer()
  def group2_block_len(version, error_correction_level)

  for {version, error_correction_level, _, _, _, group2_block_len, _} <- @error_correction_table do
    def group2_block_len(unquote(version), unquote(error_correction_level)), do: unquote(group2_block_len)
  end

  def group2_block_len(_version, _error_correction_level), do: 0

  @spec group2_codewords_per_block(version(), error_correction_level()) :: non_neg_integer()
  def group2_codewords_per_block(version, error_correction_level)

  for {version, error_correction_level, _, _, _, _, group2_codewords_per_block} <- @error_correction_table do
    def group2_codewords_per_block(unquote(version), unquote(error_correction_level)), do: unquote(group2_codewords_per_block)
  end

  def group2_codewords_per_block(_version, _error_correction_level), do: 0

  # {:version, :remainer}
  @remainer [
    {1, 0},
    {2, 7},
    {3, 7},
    {4, 7},
    {5, 7},
    {6, 7},
    {7, 0},
    {8, 0},
    {9, 0},
    {10, 0},
    {11, 0},
    {12, 0},
    {13, 0},
    {14, 3},
    {15, 3},
    {16, 3},
    {17, 3},
    {18, 3},
    {19, 3},
    {20, 3},
    {21, 4},
    {22, 4},
    {23, 4},
    {24, 4},
    {25, 4},
    {26, 4},
    {27, 4},
    {28, 3},
    {29, 3},
    {30, 3},
    {31, 3},
    {32, 3},
    {33, 3},
    {34, 3},
    {35, 0},
    {36, 0},
    {37, 0},
    {38, 0},
    {39, 0},
    {40, 0}
  ]

  @spec remainer(any) :: 0..7
  def remainer(_version)

  for {version, remainer} <- @remainer do
    def remainer(unquote(version)), do: unquote(remainer)
  end

  def remainer(_version), do: 0
end
