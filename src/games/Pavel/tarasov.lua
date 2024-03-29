build_take_off_area = function(s, w)
	if have 'грязь' and have 'палки' then
		p "Мы построили площадку"
		remove(_"грязь")
		remove(_"палки")
		walk("стартовая площадка")
		return
	end
	p [[Кажется чего-то не хватает]]
end

build_house = function(s, w)
	if have 'камни' and have 'пыль' then
		p "Мы построили жк"
		remove(_"камни")
		remove(_"пыль")
		walk("жк")
		return
	end
	p [[Кажется чего-то не хватает]]
end

build_gym = function(s, w)
	if have 'блины' and have 'гриф' then
		p "Мы построили качалку"
		remove(_"блины")
		remove(_"гриф")
		walk("качалка")
		return
	end
	p [[Кажется чего-то не хватает]]
end


room {
    nam = 'луна_1';
    disp = "Луна";
    dsc = [[Наокнец ты не на Луне. Направляйся в здание космостроя.]];
    pic = 'assets/img/Pavel/luna_1.jpg';
    way = {
        path {"Подойти к зданию","Здание космостроя_2"}
    };
}

room {
    nam = 'Здание космостроя_2';
    disp = "Комплекс зданий космостроя";
    pic = 'assets/img/Pavel/luna_2.jpg';
    way = {
        path {"Зайти в главное здание космостроя", "космострой"}
    };
}

room {
    nam = 'космострой';
    disp = "Холл главного здания";
    pic = 'assets/img/Pavel/luna_3.jpg';
    dsc = [[Направляйся в кабинет номер 4, там тебя введут в курс дела]];
    way = {
        path {"Зайти в кабинет номер 4", "кабинет 4"}
    };
}

room {
    nam = 'кабинет 4';
    disp = "Вонючий кабинет номер 4, в котором сидит начальник";
    dsc = [[Тебе нужно построить стартовую площадку, иди до кратора, там будут необходимые материалы.
            Потом необходимо построить ЖК для космонавтов его нужно построить на ровнине.
            Затем направляйся к холму и построй там качалку для космонавтов]];
    pic = 'assets/img/Pavel/luna_3.jpg';
    way = {
        path {"Пойти до кратора", "кратор"}
    };
}



room {
	nam = 'кратор';
    pic = 'assets/img/Pavel/luna_5.jpg';
	disp = "Кратор";
} :with {
	obj {
		nam = 'грязь';
		dsc = 'В краторе лежит {грязь}';
		tak = 'Вы взяли грязь.';
		use = build_take_off_area;
	},
	obj {
		nam = 'палки';
		dsc = 'В краторе лежат {палки}';
		tak = 'Вы взяли палки.';
		use = build_take_off_area;
	}
}

room {
    nam = 'стартовая площадка';
    dsc = 'Неплохо получилось';
    disp = 'Стартовая площадка';
    pic = 'assets/img/Pavel/luna_6.jpg';
    way = {
        path {"Пойти на ровнину", "равнина"}
    }
}

room {
	nam = 'равнина';
    pic = 'assets/img/Pavel/luna_7.jpg';
	disp = "Равнина";
} :with {
	obj {
		nam = 'камни';
		dsc = 'Здесь много {камней}';
		tak = 'Вы взяли камни';
		use = build_house;
	},
	obj {
		nam = 'пыль';
		dsc = 'Тут много {пыли}';
		tak = 'Вы взяли пыль';
		use = build_house;
	}
}

room {
    nam = 'жк';
    dsc = 'Хороший жк';
    disp = 'Жилой комплекс';
    pic = 'assets/img/Pavel/luna_8.jpg';
    way = {
        path {"Прогуляться до холма", "холм"}
    }
}

room {
	nam = 'холм';
    pic = 'assets/img/Pavel/luna_9.jpg';
	disp = "Холм";
} :with {
	obj {
		nam = 'блины';
		dsc = 'Здесь есть {блины} разных весов';
		tak = 'Вы взяли блины';
		use = build_gym;
	},
	obj {
		nam = 'гриф';
		dsc = 'Тут много {гриф}ов';
		tak = 'Вы взяли грифы';
		use = build_gym;
	}
}

room {
    nam = 'качалка';
    dsc = 'Крутая качалка';
    disp = 'Качалка';
    pic = 'assets/img/Pavel/luna_10.jpg';
    way = {
        path {"конец", "конец_площадка"}
    }
}

room {
    nam = 'конец_площадка';
    dsc = 'Начальник выражает слова благодарности за проделанную работу';
    disp = 'Конец';
    pic = 'assets/img/Pavel/luna_11.jpg';
    way = {
        path {"Тестирование", "космодром"}
    }
}
