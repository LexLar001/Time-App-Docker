<script>
import moment from 'moment'
import { startInterval, saveTime, deleteTime } from '../utils/time'

export default {
  props: {
    showSavedTimes: Boolean,
  },
  data() {
    return {
      currentTime: moment().format('HH:mm:ss'),
      savedTimes: [],
    }
  },
  methods: {
    startInterval,
    saveTime,
    deleteTime,
  },
  created: async function () {
    this.startInterval()
    const res = await fetch('http://localhost:5555/times')
    const json = await res.json()
    if (json.length) this.savedTimes = json
  },
}
</script>

<template>
  <div class="greetings">
    <h1 class="green">Time-App</h1>
    <h1 class="green">{{ currentTime }}</h1>
    <h3>Press button for save time</h3>
    <button @click="saveTime">Save Time</button>
    <h3 v-if="savedTimes.length && showSavedTimes">
      Previously saved times:
    </h3>
    <div
      v-if="showSavedTimes"
      class="deleted-items"
      v-for="savedTime in savedTimes"
      :key="savedTime.id"
    >
      <div class="deleted-item">{{ savedTime.time }}</div>
      <button class="btn-sm bg-red" @click="() => deleteTime(savedTime.id)">
        Delete
      </button>
    </div>
  </div>
</template>

<style scoped>
h1 {
  font-weight: bold; 
  font-size: 3rem; 
  margin-top: 20px; 
}

h3 {
  font-size: 1.5rem; 
}

button {
  font-size: 1rem;
  margin: 20px; 
  padding: 8px 16px;
  background-color: #ff5722;
  border-radius: 8px;
  border: none;
  cursor: pointer;
}

.btn-sm {
  margin: 10px; 
  padding: 4px 8px; 
  font-size: 0.8rem; 
}

.bg-red {
  background-color: #ff0000; 
  color: #ffffff; 
}

.deleted-items {
  font-size: 1.2rem; 
}

.deleted-item {
  width: 120px;
  display: inline-block;
}

.greetings {
  text-align: center;
}
</style>
