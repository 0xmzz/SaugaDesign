<template>
  <div>
    <!-- <v-alert color="#2A3B4D" dark dense>
      The winter discount is back with 15% off all orders over $50!
    </v-alert> -->
    

    <v-app-bar>
      

      <v-spacer></v-spacer>
<span class="hidden-sm-and-up" >
        <v-btn @click.stop="drawer = !drawer" class="menu" absolute > Menu </v-btn>
      </span>
    

      <v-toolbar-items class="hidden-xs-only">
        <v-btn to="/" text> Home </v-btn>

        <v-btn to="installation" text> DIY Installation </v-btn>
        <v-btn to="aboutus" text> About us! </v-btn>
        <v-btn href="#cart" text> Cart </v-btn>
      </v-toolbar-items>
    </v-app-bar>
  
    <v-navigation-drawer v-model="drawer" class="container" absolute >
      <v-list>
        <v-list-item
          v-for="item in items"
          :key="item.title"
          :to="item.link"
          link
        >
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-btn class="container" href="#cart" text> Cart </v-btn>
      </v-list>
    </v-navigation-drawer>
  </div>
</template>

<script>
module.exports = {
  data() {
    return {
      drawer: false,
      items: [
        { title: "Home", link: "/" },
        { title: "DIY Installation", link: "installation" },
        { title: "About us!", link: "aboutus" },
      ],
    };
  },
};
</script>
<style>
.menu {
  top: 19%;
  left: 32.5%;
  width: 150px;
  
 
}
.title{
  position: relative;
  left: 40%;
  
}
</style>
