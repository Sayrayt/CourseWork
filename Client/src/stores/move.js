import {defineStore} from "pinia";

export const useMoveStore = defineStore('move', {
    state: () => ({
        favorite: JSON.parse(localStorage.getItem('favoriteMove')) || [],
        viewed: JSON.parse(localStorage.getItem('viewedMove')) || [],
        moves: [
            {
                id: 0,
                name: "Бойцовский клуб",
                country: "США",
                genre: "психологический триллер",
                director: "Дэвид Финчер",
                cast: ["Эдвард Нортон", "Брэд Питт", "Хелена Бонэм Картер"]
            },
            {
                id: 1,
                name: "Гарри Поттер и философский камень",
                country: "Великобритания",
                genre: "фэнтези",
                director: "Крис Коламбус",
                cast: ["Дэниел Рэдклифф", "Руперт Гринт", "Эмма Уотсон"]
            },
            {
                id: 2,
                name: "1+1",
                country: "Франция",
                genre: "драма",
                director: "Оливье Накаш",
                cast: ["Франсуа Клюзе", "Омар Си", "Анн Ле Ни"]
            }
        ]
    }),
    getters: {
        viewedMoves: (state) => state.moves.filter(({id}) => state.viewed.includes(id)),
        favoriteMoves: (state) => state.moves.filter(({id}) => state.favorite.includes(id)),
        markedMoves: (state) => state.moves.filter(({id}) => (state.favorite.includes(id)) || state.viewed.includes(id))
    },
    actions: {
        setFavorite(id) {
            if (this.favorite.indexOf(id) === -1) {
                this.favorite.push(id);
            } else {
                this.favorite.splice(this.favorite.indexOf(id), 1)
            }
            localStorage.setItem('favoriteMove', JSON.stringify(this.favorite))
        },
        setViewed(id) {
            if (this.viewed.indexOf(id) === -1) {
                this.viewed.push(id);
            } else {
                this.viewed.splice(this.viewed.indexOf(id), 1)
            }
            localStorage.setItem('viewedMove', JSON.stringify(this.viewed))
        },
    },
})
