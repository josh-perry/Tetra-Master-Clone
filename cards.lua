BASE_CARDS = {}

local function get_stat(x)
    local bonus_stats = {"A", "B", "C", "D", "E", "F"}

    for i, v in ipairs(bonus_stats) do
        if v == x then
            return 9 + i
        end
    end

    return tonumber(x)
end

local function load_card(name, stat_code)
  local c = {
    name = name,
    attack = get_stat(string.sub(stat_code, 1, 1)),
    attack_string = string.sub(stat_code, 1, 1),
    type = string.sub(stat_code, 2, 2),
    physical_defense = get_stat(string.sub(stat_code, 3, 3)),
    physical_defense_string = string.sub(stat_code, 3, 3),
    magical_defense = get_stat(string.sub(stat_code, 4, 4)),
    magical_defense_string = string.sub(stat_code, 4, 4),
    id = table.getn(BASE_CARDS) + 1
  }

  table.insert(BASE_CARDS, c)
end

load_card("Goblin","0P00")
load_card("Fang","0P00")
load_card("Skeleton","0P00")
load_card("Flan","0M01")
load_card("Zaghnol","0P00")
load_card("Lizardman","1P00")
load_card("Zombie","1P10")
load_card("Bomb","1M01")
load_card("Ironite","1P10")
load_card("Sahagin","1P10")
load_card("Yeti","1M01")
load_card("Mimic","1M11")
load_card("Wyerd","1M02")
load_card("Mandragora","2M02")
load_card("Crawler","2P20")
load_card("S. Scorpion","2P21")
load_card("Nymph","2M02")
load_card("Sand Golom","2P21")
load_card("Zuu","2P02")
load_card("Dragonfly","2P21")
load_card("Carrion Worm","2M11")
load_card("Cerberus","3P20")
load_card("Antlion","3P31")
load_card("Cactuar","3PC0")
load_card("Gimme Cat","3M21")
load_card("Ragtimer","3M21")
load_card("Hedgehog Pie","3M12")
load_card("Raluimahgo","3P40")
load_card("Ocho","3P21")
load_card("Troll","4P32")
load_card("Blazer Beetle","4P51")
load_card("Abomination","4P33")
load_card("Zemzelett","4M26")
load_card("Stroper","4P40")
load_card("Tantarian","4M22")
load_card("Grand Dragon","4P44")
load_card("Feather Circle", "4M22")
load_card("Hecteyes","5M04")
load_card("Ogre","5P41")
load_card("Armstrong","5M24")
load_card("Ash","5M33")
load_card("Wraith","5M51")
load_card("Gargoyle","5M32")
load_card("Vepal","5M33")
load_card("Grimlock","5M23")
load_card("Tonberry","2P33")
load_card("Veteran","5M19")
load_card("Garuda","6M41")
load_card("Malboro","5M36")
load_card("Mover","6MF0")
load_card("Abadon","7M62")
load_card("Behemoth","BP46")
load_card("Iron Man","CP60")
load_card("Nova Dragon","EP7C")
load_card("Ozma","DM0C")
load_card("Hades","FMC1")
load_card("Holy","8M23")
load_card("Meteor","BMA0")
load_card("Flare","DM11")
load_card("Shiva","5M05")
load_card("Ifrit","6M91")
load_card("Ramuh","4M16")
load_card("Atomos","4M66")
load_card("Odin","CM84")
load_card("Leviathan","BM61")
load_card("Bahamut","CM95")
load_card("Ark","EM65")
load_card("Fenrir","8M21")
load_card("Madeen","AM16")
load_card("Alexander","EMB5")
load_card("Excalibur 2","FPB0")
load_card("Ultima Weapon","FP16")
load_card("Masamune","CPB3")
load_card("Elixer","6M66")
load_card("Dark Matter","CM3C")
load_card("Ribbon","0MCF")
load_card("Tiger Paw Racket", "0P01")
load_card("Save The Queen","7P30")
load_card("Genji","0P6A")
load_card("Mythril Sword","2P00")
load_card("Blue Narciss","8P91")
load_card("Hilde Garde 3","6P31")
load_card("Invincible","BP9C")
load_card("Cargo Ship","2P60")
load_card("Hilda Garde 1","6P40")
load_card("Red Rose","8P19")
load_card("Theater Ship","2P61")
load_card("Viltgance","EP92")
load_card("Chocobo","0P00")
load_card("Fat Chocobo","1P11")
load_card("Mog","0M00")
load_card("Frog","0P00")
load_card("Oglop","2P20")
load_card("Alexandria","0PB6")
load_card("Lindblum","0P6B")
load_card("Twin Moons","7M55")
load_card("Gargant","2P03")
load_card("Namingway","7M77")
load_card("Boko THE Chocobo", "8P77")
load_card("Airship","8P77")

return cards
