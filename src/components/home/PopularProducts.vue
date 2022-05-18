<template>
  <v-container>
    <fab
      :position="position"
      :bg-color="bgColor"
      :actions="fabActions"
      @message="whatsappfunc"
      @call="call"
    ></fab>
    <v-card class="container">

      <v-form ref="form" v-model="valid" lazy-validation>
        <div>
          <v-row>
            <v-col>
              <v-divider></v-divider>
              <v-card>
                <div>
                  <v-card>
                    <div class="container">
                      <v-text-field
                        label="Enter your Address here!"
                        class="input"
                        v-model.trim="overlay"
                        hide-details="auto"
                        :rules="Rules"
                        ref="Address"
                        required
                      ></v-text-field>
                      <br>
                      <br>
                      <div class="main2">
                      <v-card class="bb" :class="font"> {{ overlay }}</v-card>
                    </div>

                    </div>
                  </v-card>
                  
                  

                  <div>
                    
                    <v-card class="signheight">
                      <div><h5>Approximate Width:  {{ Compensate }} </h5></div>
                      <div><h5>Height: {{ isHeight }}</h5></div>

                      <div v-if="(containsdecender == 1)">
                       <h6> * Height is from lowest to
                        highest point.</h6>
                        <img src="../../assets/height.png" /></div
                    ></v-card>
                    <div>
                  
                    <!-- <h5 class="green1">Winter Sale 15% off</h5> -->
                    
                      <h5 class="inputprice"> {{ calculateCost }}</h5>
                    
                   <!-- Winter discount -->
                    <!-- <div class="input">
                      {{ calculateCostdiscount }}
                    </div> -->
                      
                    
                    
                  </div>
                  </div>
                </div>

                <v-card>
                  <h3>Font offerings</h3>

                  <v-radio-group
                    text-align:center
                    class="radio"
                    v-model="radio.value"
                    :mandatory="true"
                  >
                    <v-row class="container" dense>
                      <v-radio
                        class="radio-1"
                        label="Edward"
                        value="1"
                        id="one"
                      />

                      <v-radio
                        class="radio-2"
                        label="Birds of Paradise"
                        value="2"
                      />

                      <v-radio class="radio-6" label="Aerolite" value="6" />
                      <v-radio class="radio-7" label="Script" value="7" />
                    </v-row>

                    <v-row class="container" dense>
                      <v-radio class="radio-4" label="Slimlines" value="4" />

                      <v-radio class="radio-5" label="COPASETIC" value="5" />
                      <v-radio class="radio-3" label="Kavo" value="3" />
                      <v-radio class="radio-9" label="Dancing" value="9" />
                    </v-row>

                    <v-row class="container" dense>
                      <v-radio class="radio-8" label="Custom Font" value="8" />
                      <div class="container">
                        <v-text-field
                          v-model="isInstructions"
                          label="Enter the font name (Preview will not be availaible)"
                          v-if="radio.value == '8'"
                          :rules="Rules"
                          required
                        ></v-text-field>
                      </div>
                    </v-row>
                  </v-radio-group>
                </v-card>

                <div class="container">
                  <div class="selection">
                    <v-row sm="2">
                      <v-select
                        id="colour"
                        v-model="items.isColor.color"
                        :items="items.colours"
                        :item-value="items.colours.color"
                        item-text="color"
                        label="Sign Colour (Acrylic)"
                        dense
                        :rules="Rules"
                        required
                      ></v-select>
                    </v-row>

                    
                    <v-row>
                      <v-select
                        v-model="isHeight"
                        :items="items.height"
                        :item-value="items.height"
                        label="Sign Height"
                        dense
                        :rules="Rules"
                        required
                      ></v-select>
                    </v-row>  

                    <v-row>
                      <v-select
                        v-model="isLED"
                        :items="items.LED"
                        :item-value="items.LED"
                        label="LED Backlit"
                        dense
                        :rules="Rules"
                        required
                      ></v-select>
                    </v-row> 


                       
                    <v-col>
                    <v-img
                    width="40vh"
                        aspect-ratio="4"
                        src="../../assets/led.jpeg"
                      ></v-img>
                      </v-col>
                    

                    <v-row>
                      <v-select
                        v-model="isthickness"
                        :items="items.thickness"
                        :item-value="items.thickness"
                        label="Cast acrylic thickness"
                        dense
                        :rules="Rules"
                        required
                      ></v-select>
                      
                    </v-row>
                    <v-col>
                    <v-img
                    width="40vh"
                        aspect-ratio="4"
                        src="../../assets/6mm3mm.jpeg"
                      ></v-img>
                      </v-col>
                    <v-row>
                      <v-select
                        v-model="isInstall"
                        :items="items.install"
                        :item-value="items.install"
                        label="Do you require installation?"
                        dense
                        :rules="Rules"
                        required
                      ></v-select>
                    </v-row>

                    <template v-if="isInstall === 'Yes'">
                      <v-select
                        v-model="isLocation"
                        :items="items.location"
                        :item-value="items.location"
                        label="Installation Quote by Region"
                        dense
                        :rules="Rules"
                        required
                      ></v-select>
                      <div class="red">
                        Please note that we do not install signs higher than 12 feet or remove any old signage or lighting.
                        
                      </div>
                      <div class="orange">
                        We will not be doing any installation between 18th December to 3rd January. Installations are subject to weather conditions.

              
                      </div>
                      
                      <v-img
                        aspect-ratio="2"
                        src="https://github.com/zubairzia0/SaugaDesign-Site/blob/master/assets/GTA.png?raw=true"
                      ></v-img>
                    </template>

                    <template v-if="isInstall === 'No'"></template>

                    <div class="container" v-if="this.valid == false">
                      <p class="red">Please fill all required fields above</p>
                    </div>
                  </div>
                  <v-btn
                    :disabled="!valid"
                    color="success"
                    @click="validate"
                    id="custom-sign"
                    :class="validater()"
                    data-item-id="custom-sign"
                    data-item-price="0.00"
                    data-item-url="https://saugadesign.com"
                    data-item-description="Custom made house address sign"
                    data-item-image="https://github.com/zubairzia0/SaugaDesign-Site/blob/master/assets/SaugaSignslogo.PNG?raw=true"
                    data-item-name="Custom Sign"
                    data-item-custom1-name="Address Sign Text (do not change)"
                    data-item-custom1-type="textarea"
                    data-item-custom1-required="true"
                    :data-item-custom1-value="overlay"
                    data-item-custom10-name="# of alphanumerics (do not change)"
                    :data-item-custom10-value="isNumber"
                    data-item-custom10-options="1[+7.65]|2[+15.3]|3[+22.95]|4[+30.6]|5[+38.25]|6[+45.9]|7[+53.55]
                      |8[+61.2]|9[+68.85]|10[+76.5]|11[+84.15]|12[+91.8]|13[+99.45]|14[+107.1]|15[+114.75]|16[+122.4]|17[+130.05]|18[+137.7]|19[+145.35]|20[+153]|21[+160.65]
                      |22[+168.3]|23[+175.9]|24[+183.6]|25[+191.25]|26[+198.9]|27[+206.55]|28[+214.2]|29[+221.85]|30[+229.5]"
                    data-item-custom2-name="Acrylic Colour"
                    data-item-custom2-options="Black Glossy|Black Matte +$10[+10]|White Glossy|Grey Glossy"
                    data-item-custom2-required="true"
                    :data-item-custom2-value="items.isColor.color"
                    data-item-custom4-name="Font Choice"
                    data-item-custom4-options="Edward|Script|Birds|Kavo|Slimlines|Copasetic|Aerolite|Dancing|Custom"
                    data-item-custom4-required="true"
                    :data-item-custom4-value="font"
                    data-item-custom9-name="Height"
                    data-item-custom9-options="5 Inch|6 Inch|7 Inch|8 Inch|8.5 Inch|9.5 Inch +$10[+10]|10.5 Inch +$20[+20]|12 Inch +$30[+30]|Custom"
                    data-item-custom9-required="true"
                    :data-item-custom9-value="isHeight"
                    
                    data-item-custom5-name="LED Backlit"
                    data-item-custom5-options="Yes|No"
                    data-item-custom5-required="true"
                    :data-item-custom5-value="isLED"

                     data-item-custom15-name="# of LED alphanumerics (do not change)"
                    :data-item-custom15-value="isNumberLED"
                    data-item-custom15-options="1[+7.65]|2[+15.3]|3[+22.95]|4[+30.6]|5[+38.25]|6[+45.9]|7[+53.55]
                      |8[+61.2]|9[+68.85]|10[+76.5]|11[+84.15]|12[+91.8]|13[+99.45]|14[+107.1]|15[+114.75]|16[+122.4]|17[+130.05]|18[+137.7]|19[+145.35]|20[+153]|21[+160.65]
                      |22[+168.3]|23[+175.9]|24[+183.6]|25[+191.25]|26[+198.9]|27[+206.55]|28[+214.2]|29[+221.85]|30[+229.5]"


                   data-item-custom14-name="Acrylic Thickness"
                    data-item-custom14-options="3mm|6mm +$40 [+40]"
                    data-item-custom14-required="true"
                    :data-item-custom14-value="isthickness"

                     data-item-custom7-name="Installation Locaton"
                    data-item-custom7-options="N/A|Halton +$100[+100]|Hamilton +$120[+120]|Peel +$100[+100]|City of Toronto +$120[+120]|York +$120[+120]|Durham +$140[+140]|Kitchener/Waterloo/Guelph/Cambridge/Other +$140[+140]"

                    data-item-custom7-required="true"
                    :data-item-custom7-value= "isLocation"

                    data-item-custom8-name="Phone Number"
                    data-item-custom8-required="true"
                    data-item-custom13-name="Any Special Instructions/Requests?"
                    data-item-custom13-type="textarea"
                    :data-item-custom13-value="isInstructions"
                    data-item-has-taxes-included="true"
                    >*Add to cart
                  </v-btn>
                  
                    <div>
                  
                    <!-- <h4 class="green1">Winter Sale 15% off</h4> -->
                    <div class="inputprice">
                      {{ calculateCost }}
                      </div>
                    <!-- <div class="input">
                      {{ calculateCostdiscount }}
                    </div> -->
                      
                    
                    
                  </div>

                  <v-col> </v-col>

                  <div>
                    <h1>Extra Details:</h1>
                    
                      <li> We use Cast Acrylic material for the sign, it has an emaculate finish and is weather resistant for up to 30 years</li>
                      
                      <li> It can take 2 - 6 business days to prepare the sign for shipping</li>
                      <li> Signs come with the essentials for a drill install (Epoxy not included)</li>
                     <li> We allow deffered payments for pickup but not for delivery, you will find the deffered payment on the 3rd stage of the checkout step</li>
                     
                    
                  </div>
                </div>
              </v-card>
            </v-col>
          </v-row>
        </div>

        <v-card class="mx-auto" max-width="600">
          <h2>Do-it-yourself (DIY) essentials included:</h2>
          <br />

          <v-img
            class="mx-auto"
            src="https://github.com/zubairzia0/saugasigns/blob/master/assets/included.png?raw=true"
          ></v-img>
          <br />

          <ol>
            <strong>1.</strong>
            A custom Laser cut cast acrylic sign according to your specification
          </ol>
          <ol>
            <strong>2.</strong>
            A traced template of the sign for installation
          </ol>
          <ol>
            <strong>3.</strong>
            Galvanized nails
          </ol>
          <h3>
            <a href="https://saugadesign.com/#/installation"
              >Click here for Installation instructions</a
            >
          </h3>
        </v-card>
        <br />

        <v-card class="mx-auto" max-width="600">
          <h2>Client Photos</h2>
          <Lingallery
            :iid.sync="currentId"
            :width="600"
            :height="200"
            :items="[

           
              {
                id: 'someid1',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide20.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide20.JPG?raw=true',
              },
              {
                id: 'someid2',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide21.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide21.JPG?raw=true',
              },
              {
                id: 'someid3',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide19.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide19.JPG?raw=true',
              },
              {
                id: 'someid1',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide22.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide22.JPG?raw=true',
              },
              {
                id: 'someid1',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide23.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide23.JPG?raw=true',
              },
              {
                id: 'someid4',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide1.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide1.JPG?raw=true',
              },
              {
                id: 'someid5',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide2.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide2.JPG?raw=true',
              },
              {
                id: 'someid6',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide6.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide6.JPG?raw=true',
              },
              {
                id: 'someid7',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide7.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide7.JPG?raw=true',
              },

              {
                id: 'someid8',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide8.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide8.JPG?raw=true',
              },
              {
                id: 'someid9',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide9.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide9.JPG?raw=true',
              },
              {
                id: 'someid10',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide10.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide10.JPG?raw=true',
              },
              {
                id: 'someid11',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide11.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide11.JPG?raw=true',
              },
              {
                id: 'someid12',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide12.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide12.JPG?raw=true',
              },
              {
                id: 'someid13',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide13.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide13.JPG?raw=true',
              },
              {
                id: 'someid14',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide14.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide14.JPG?raw=true',
              },
              {
                id: 'someid15',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide15.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide15.JPG?raw=true',
              },
              {
                id: 'someid16',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide16.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide16.JPG?raw=true',
              },
              {
                id: 'someid17',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide3.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide3.JPG?raw=true',
              },
              {
                id: 'someid18',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide4.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide4.JPG?raw=true',
              },
              {
                id: 'someid19',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide18.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide18.JPG?raw=true',
              },
              {
                id: 'someid20',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide17.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide17.JPG?raw=true',
              },
              {
                id: 'someid21',
                src:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide5.JPG?raw=true',
                thumbnail:
                  'https://github.com/zubairzia0/saugasigns/blob/master/assets/Slide5.JPG?raw=true',
              },
            ]"
          />
        </v-card>
      </v-form>
      
      <br /><br />
      <h2>Client Reviews</h2>
      <div
        data-romw-token="e47y6hel5LDx6B5bXByW5vlW3qHmByXZVqAlEzzFxdE9dQaBtF"
      ></div>
    </v-card>
  </v-container>
</template>

<script>
import Lingallery from "lingallery";

import fab from "vue-fab";

import Vue from "vue";
import VTooltip from "v-tooltip";
// import EasyInstaFeed from "easy-instagram-feed";

Vue.use(VTooltip);
// EasyInstaFeed(feedUrl);

// import textMetrics from "text-metrics";

export default {
  name: "App2",

  components: { Lingallery, fab },

  data: () => ({
    bgColor: "#778899",
    position: "bottom-right",
    fabActions: [
      {
        name: "call",
        icon: "call",
      },
      {
        name: "message",
        icon: "message",
      },
    ],

    items: {
      colours: [
        { color: "Black Glossy", id: 1 },
        { color: "Black Matte +$10", id: 2 },
        
        { color: "White Glossy", id: 3 },
        { color: "Grey Glossy", id: 4 },
      ],
      
        
      
      images: ["../../assets/Crosscurrent.jpeg", "../../assets/faris.jpeg"],
      isColor: {
        color: "",
      },
      
      //   selectedOptionId: 0,

      matte: false,
      surface: ["Brick", "Stucco", "Stone", "Other"],
      thickness:  [
      "3mm",
      "6mm +$40",
                  ],

        
      
      height: [
        "5 Inch",
        "6 Inch",
        "7 Inch",
        "8 Inch",
        "8.5 Inch",
        "9.5 Inch +$10",
        "10.5 Inch +$20",
        "12 Inch +$30",
      ],
      LED: ["Yes", "No"],
      install: ["Yes", "No"],
      location: [
        "Halton +$100",
        "Hamilton +$120",
        "Peel +$100",
        "City of Toronto +$120",
        "York +$120",
        "Durham +$140",
        "Kitchener/Waterloo/Guelph/Cambridge/Other +$140",
      ],
      pickup: "",
      payNow: ["Yes", "No"],
      Delivery: ["Yes", "No"],
    },
    Rules: [(v) => !!v || "required"],
    valid: false,
    currentId: "someid1",
    // isSurface: "",

    isHeight: "8.5 Inch",
    isLED: "No",
    isDeliver: "",
    isthickness: "",
    isInstall: "",
    isLocation: "",

    isInstructions: "",
    overlay: "",

    cost: 0,

    decender: false,

    radio: {
      value: "",
    },
  }),

  computed: {
    LetterHeight: function() {
      if (this.isHeight == "9.5 Inch +$10") {
        return 10;
      } else if (this.isHeight == "10.5 Inch +$20") {
        return 20;
      } else if (this.isHeight == "12 Inch +$30") {
        return 30;
      }
      return 0;
    },

    Thickness: function() {
      if (this.isthickness == "6mm +$40") {
        return 40;
    } else return 0;},

    LocationPrice: function() {
      if (this.items.isColor.color == "Black Matte +$10") {
        if (
          (this.isInstall == "Yes" && this.isLocation == "Halton +$100") ||
          (this.isInstall == "Yes" && this.isLocation == "Peel +$100")
        ) {
          return 110;
        } else if (
          (this.isInstall == "Yes" &&
            this.isLocation == "City of Toronto +$120") ||
          (this.isInstall == "Yes" && this.isLocation == "York +$120") ||
          (this.isInstall == "Yes" && this.isLocation == "Hamilton +$120")
        ) {
          return 130;
        } else if (
          (this.isInstall == "Yes" && this.isLocation == "Durham +$140") ||
          (this.isInstall == "Yes" &&
            this.isLocation == "Kitchener/Waterloo/Guelph/Cambridge +$140")
        ) {
          return 150;
        } else {
          return 10;
        }
      } else {
        if (
          (this.isInstall == "Yes" && this.isLocation == "Halton +$100") ||
          (this.isInstall == "Yes" && this.isLocation == "Peel +$100")
        ) {
          return 100;
        } else if (
          (this.isInstall == "Yes" &&
            this.isLocation == "City of Toronto +$120") ||
          (this.isInstall == "Yes" && this.isLocation == "York +$120") ||
          (this.isInstall == "Yes" && this.isLocation == "Hamilton +$120")
        ) {
          return 120;
        } else if (
          (this.isInstall == "Yes" && this.isLocation == "Durham +$140") ||
          (this.isInstall == "Yes" &&
            this.isLocation ==
              "Kitchener/Waterloo/Guelph/Cambridge/Other +$140")
        ) {
          return 140;
        }
        return 0;
      }
    },

    letters: function() {
      return this.overlay.length;
    },

    colorIs: function() {
      return this.isColor.color;
    },

//Cost per letter
    costLength: function() {
      var overlayText = this.overlay;
      var rmSpace = overlayText.split(" ").join("");

      if (this.isLED == "Yes") {
      
      return rmSpace.length * 15.3;
    } else {
     
      return rmSpace.length * 7.65;
    }
    },

    // costLED: function() {
    //    {
    //     return 0;
    //   }

    calculateCost: function() {
      // var overlayText = this.overlay;
      // var rmSpace = overlayText.split(" ").join("");

      var costDec =
        this.cost +
        this.LetterHeight +
        this.LocationPrice +
        this.Thickness +
        this.costLength;
      return "$" + costDec.toFixed(2);
    },

    // This function is for winter discount calculation

    // calculateCostdiscount: function() {
    //   var overlayText = this.overlay;
    //   var rmSpace = overlayText.split(" ").join("");

    //   var costDec =
    //     this.cost +
    //     this.LetterHeight +
    //     this.LocationPrice +
    //     this.Thickness +
    //     rmSpace.length * 7.65;
    //   return "$" + (costDec * 0.85).toFixed(2);
    // },

  //FOr snipcart to calculate cost per letter
    isNumber: function() {
      var overlayText = this.overlay;
      var rmSpace = overlayText.split(" ").join("");
      return rmSpace.length;
    },

  isNumberLED: function() {
      var overlayText = this.overlay;
      var rmSpace = overlayText.split(" ").join("");
      return rmSpace.length;
    },

    font: function() {
      if (this.radio.value == 1) {
        return "Edward";
      } else if (this.radio.value == 7) {
        return "Script";
      } else if (this.radio.value == 2) {
        return "Birds";
      } else if (this.radio.value == 3) {
        return "Kavo";
      } else if (this.radio.value == 4) {
        return "Slimlines";
      } else if (this.radio.value == 5) {
        return "Copasetic";
      } else if (this.radio.value == 6) {
        return "Aerolite";
      } else if (this.radio.value == 8) {
        return "Custom";
      } else if (this.radio.value == 9) {
        return "Dancing";
      } else {
        return "";
      }
    },
    getTextWidth: function() {
      // if given, use cached canvas for better performance
      // else, create new canvas
      var isFont = "";
      if (this.font == "Edward") {
        if (this.isHeight == "9.5 Inch +$10") {
          isFont = "13.5px" + " " + "Edward";
        } else if (this.isHeight == "10.5 Inch +$20") {
          isFont = "14.5px" + " " + "Edward";
        } else if (this.isHeight == "12 Inch +$30") {
          isFont = "16.5px" + " " + "Edward";
        } else if (this.isHeight == "8 Inch") {
          isFont = "11px" + " " + "Edward";
        } else if (this.isHeight == "7 Inch") {
          isFont = "9px" + " " + "Edward";
        } else if (this.isHeight == "6 Inch") {
          isFont = "8px" + " " + "Edward";
        } else if (this.isHeight == "5 Inch") {
          isFont = "7px" + " " + "Edward";
        } else isFont = "12px" + " " + "Edward";
      } else if (this.font == "Script") {
        if (this.isHeight == "9.5 Inch +$10") {
          isFont = "13.5px" + " " + "Script";
        } else if (this.isHeight == "10.5 Inch +$20") {
          isFont = "14.5px" + " " + "Script";
        } else if (this.isHeight == "12 Inch +$30") {
          isFont = "16.5px" + " " + "Script";
        } else if (this.isHeight == "8 Inch") {
          isFont = "11px" + " " + "Script";
        } else if (this.isHeight == "7 Inch") {
          isFont = "9px" + " " + "Script";
        } else if (this.isHeight == "6 Inch") {
          isFont = "8px" + " " + "Script";
        } else if (this.isHeight == "5 Inch") {
          isFont = "7px" + " " + "Script";
        } else isFont = "12px" + " " + "Script";
      } else if (this.font == "Birds") {
        if (this.isHeight == "9.5 Inch +$10") {
          isFont = "13.5px" + " " + "Birds";
        } else if (this.isHeight == "10.5 Inch +$20") {
          isFont = "14.5px" + " " + "Birds";
        } else if (this.isHeight == "12 Inch +$30") {
          isFont = "16.5px" + " " + "Birds";
        } else if (this.isHeight == "8 Inch") {
          isFont = "11px" + " " + "Birds";
        } else if (this.isHeight == "7 Inch") {
          isFont = "9px" + " " + "Birds";
        } else if (this.isHeight == "6 Inch") {
          isFont = "8px" + " " + "Birds";
        } else if (this.isHeight == "5 Inch") {
          isFont = "7px" + " " + "Birds";
        } else isFont = "12px" + " " + "Birds";
      } else if (this.font == "Kavo") {
        if (this.isHeight == "9.5 Inch +$10") {
          isFont = "13.5px" + " " + "Kavo";
        } else if (this.isHeight == "10.5 Inch +$20") {
          isFont = "15px" + " " + "Kavo";
        } else if (this.isHeight == "12 Inch +$30") {
          isFont = "17.1px" + " " + "Kavo";
        } else if (this.isHeight == "8 Inch") {
          isFont = "11.4px" + " " + "Kavo";
        } else if (this.isHeight == "7 Inch") {
          isFont = "10px" + " " + "Kavo";
        } else if (this.isHeight == "6 Inch") {
          isFont = "8.5px" + " " + "Kavo";
        } else if (this.isHeight == "5 Inch") {
          isFont = "7px" + " " + "Kavo";
        } else isFont = "12.2px" + " " + "Kavo";
      } else if (this.font == "Slimlines") {
        if (this.isHeight == "9.5 Inch +$10") {
          isFont = "9px" + " " + "Slimlines";
        } else if (this.isHeight == "10.5 Inch +$20") {
          isFont = "10px" + " " + "Slimlines";
        } else if (this.isHeight == "12 Inch +$30") {
          isFont = "11.5px" + " " + "Slimlines";
        } else if (this.isHeight == "8 Inch") {
          isFont = "7.5px" + " " + "Slimlines";
        } else if (this.isHeight == "7 Inch") {
          isFont = "6.5px" + " " + "Slimlines";
        } else if (this.isHeight == "6 Inch") {
          isFont = "5.5px" + " " + "Slimlines";
        } else if (this.isHeight == "5 Inch") {
          isFont = "4.5px" + " " + "Slimlines";
        } else isFont = "8px" + " " + "Slimlines";
      } else if (this.font == "Copasetic") {
        if (this.isHeight == "9.5 Inch +$10") {
          isFont = "12.3px" + " " + "Copasetic";
        } else if (this.isHeight == "10.5 Inch +$20") {
          isFont = "13.5px" + " " + "Copasetic";
        } else if (this.isHeight == "12 Inch +$30") {
          isFont = "15.5px" + " " + "Copasetic";
        } else if (this.isHeight == "8 Inch") {
          isFont = "10.5px" + " " + "Copasetic";
        } else if (this.isHeight == "7 Inch") {
          isFont = "9.8px" + " " + "Copasetic";
        } else if (this.isHeight == "6 Inch") {
          isFont = "8px" + " " + "Copasetic";
        } else if (this.isHeight == "5 Inch") {
          isFont = "6.6px" + " " + "Copasetic";
        } else isFont = "11.5px" + " " + "Copasetic";
      } else if (this.font == "Aerolite") {
        if (this.isHeight == "9.5 Inch +$10") {
          isFont = "14.2px" + " " + "Aerolite";
        } else if (this.isHeight == "10.5 Inch +$20") {
          isFont = "16px" + " " + "Aerolite";
        } else if (this.isHeight == "12 Inch +$30") {
          isFont = "17px" + " " + "Aerolite";
        } else if (this.isHeight == "8 Inch") {
          isFont = "11.8px" + " " + "Aerolite";
        } else if (this.isHeight == "7 Inch") {
          isFont = "10px" + " " + "Aerolite";
        } else if (this.isHeight == "6 Inch") {
          isFont = "8.5px" + " " + "Aerolite";
        } else if (this.isHeight == "5 Inch") {
          isFont = "7.6px" + " " + "Aerolite";
        } else isFont = "13.2px" + " " + "Aerolite";
      } else if (this.font == "Dancing") {
        if (this.isHeight == "9.5 Inch +$10") {
          isFont = "11.4px" + " " + "Dancing";
        } else if (this.isHeight == "10.5 Inch +$20") {
          isFont = "12.8px" + " " + "Dancing";
        } else if (this.isHeight == "12 Inch +$30") {
          isFont = "14.8px" + " " + "Dancing";
        } else if (this.isHeight == "8 Inch") {
          isFont = "9.6px" + " " + "Dancing";
        } else if (this.isHeight == "7 Inch") {
          isFont = "8.4px" + " " + "Dancing";
        } else if (this.isHeight == "6 Inch") {
          isFont = "7.2px" + " " + "Dancing";
        } else if (this.isHeight == "5 Inch") {
          isFont = "6px" + " " + "Dancing";
        } else isFont = "10.2px" + " " + "Dancing";
      }

      var canvas = document.createElement("canvas");
      var context = canvas.getContext("2d");
      context.font = isFont;
      var metrics = context.measureText(this.overlay);
      return metrics.width;
    },

    Compensate: function() {
      var finalWidth;

      if (
        this.overlay.includes("y") ||
        this.overlay.includes("g") ||
        this.overlay.includes("z") ||
        this.overlay.includes("p") ||
        this.overlay.includes("q") ||
        this.overlay.includes("f") ||
        this.overlay.includes("j")
      ) {
        if (this.font == "Edward") {
          finalWidth = this.getTextWidth * 0.72;
          return finalWidth.toFixed(2) + " Inch";
        } else if (this.font == "Script") {
          finalWidth = this.getTextWidth * 0.78;

          return finalWidth.toFixed(2) + " Inch";
        } else if (this.font == "Birds") {
          finalWidth = this.getTextWidth * 0.75;

          return finalWidth.toFixed(2) + " Inch";
        } else if (this.font == "Aerolite") {
          finalWidth = this.getTextWidth * 0.78;

          return finalWidth.toFixed(2) + " Inch";
        } else if (this.font == "Custom") {
          return "Unknown";
        } else finalWidth = this.getTextWidth;

        return finalWidth.toFixed(2) + " Inch";
      } else if (this.font == "Custom") {
        return "Unknown";
      } else finalWidth = this.getTextWidth;

      return finalWidth.toFixed(2) + " Inch";
      // eslint-disable-next-line vue/return-in-computed-property
    },
    containsdecender: function() {
      if (
        this.overlay.includes("y") ||
        this.overlay.includes("g") ||
        this.overlay.includes("z") ||
        this.overlay.includes("p") ||
        this.overlay.includes("q") ||
        this.overlay.includes("f") ||
        this.overlay.includes("j")
      ) {
         
         return "1" ;
        
      }
      return "0";
    },
  },
  methods: {
    validate() {
      this.$refs.form.validate();
    },
    validater() {
      if (
        this.letters == "" ||
        this.items.isColor.color == "" ||
        this.isHeight == "" 
        || this.isInstall == "" ||
        (this.isInstall == "Yes" && this.isLocation === "")
      ) {
        return "";
      } else if (this.isInstall == "No" && this.isLocation !== "") {
        this.isLocation = "";
      } else return "snipcart-add-item";
    },
    call() {
      window.open("tel:6474084915");
    },
    whatsappfunc: function() {
      return (location.href = "https://wa.me/14168220044");
    },
  },
};
</script>

<style scoped>
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: left;
  color: #2c3e50;
}
.warrenty {
  top: 60%;
  left: 3%;
}
.main2 {
  font-size: 8.5vw;
  position: relative;
  top: 150%;
  left: 0%;
  border: 1px solid green;
  border-radius: 4px;
}
.vue-typer {
  /* Styles for the vue-typer container
     e.g. font-family, font-size  */
  position: absolute;

  text-transform: capitalize;

  font-size: 3.2vw;
  top: 9%;
  right: 21%;
  color: #000000;
}

.vue-typer2 {
  /* Styles for the vue-typer container
     e.g. font-family, font-size  */
  position: absolute;

  text-transform: capitalize;
  font-size: 2vw;
  top: 22%;
  right: 17%;
  font-weight: bold;
}
.Banner1 {
  font-family: "Slimlines";
  position: absolute;
  color: black;
  top: 52%;
  right: 56%;

  font-size: 2.3vw;

  font-weight: bolder;
}

.radio >>> label {
  margin: 0 10px 0px;
  padding: 5;
}
.radio {
  margin: 0 10px 0px;
  padding: 5;
}

.selection {
  margin: 0 5px 0px;
}

@font-face {
  src: url(../../fonts/Edwardian-Script.ttf) format("truetype");
  font-family: "Edward";
}
@font-face {
  src: url(../../fonts/birds.ttf) format("truetype");
  font-family: "Birds";
}
@font-face {
  src: url(../../fonts/Script.ttf) format("truetype");
  font-family: "Script";
}
@font-face {
  src: url(../../fonts/kavoserif-bold.otf);
  font-family: "Kavo";
}
@font-face {
  src: url(../../fonts/Slimlines.ttf) format("truetype");
  font-family: "Slimlines";
}
@font-face {
  src: url(../../fonts/Copasetic.woff) format("woff");
  font-family: "Copasetic";
}
@font-face {
  src: url(../../fonts/AeroliteScriptCP.woff) format("woff2");
  font-family: "Aerolite";
}
@font-face {
  src: url(../../fonts/DancingScript-Bold.ttf) format("truetype");
  font-family: "Dancing";
}

.radio-1 >>> label {
  font-size: 4vw;
  font-family: "Edward", Arial, sans-serif;
  font-weight: bolder;
}
.radio-2 >>> label {
  font-size: 3vw;
  font-family: "Birds", Arial, sans-serif;
}
.radio-3 >>> label {
  font-size: 4vw;
  font-family: "Kavo", Helvetica, sans-serif;
}
.radio-4 >>> label {
  font-size: 3vw;
  font-family: "Slimlines", Helvetica, sans-serif;
}
.radio-5 >>> label {
  font-size: 3vw;
  font-family: "Copasetic", Helvetica, sans-serif;
  text-transform: capitalize;
  font-weight: bolder;
}
.radio-6 >>> label {
  font-size: 4vw;
  font-family: "Aerolite", Helvetica, sans-serif;
  font-weight: bolder;
}
.radio-7 >>> label {
  font-size: 3vw;
  font-family: "Script", Arial, sans-serif;
  font-weight: bolder;
}
.radio-8 >>> label {
  font-size: 1.8vw;
  font-family: sans-serif;
  font-weight: bolder;
}
.radio-9 >>> label {
  font-size: 3.5vw;
  font-family: "Dancing";
  font-weight: bolder;
}
/* Fonts for reactive sign  */

.Edward {
  font-family: "Edward";

  font-weight: bolder;
  text-align: center;
}

.Script {
  font-family: "Script";
  font-weight: bolder;
  text-align: center;
}
.Birds {
  font-family: "Birds";
  font-weight: bold;
  text-align: center;
}
.Kavo {
  font-family: "Kavo";
  font-weight: bold;

  text-align: center;
}
.Slimlines {
  font-family: "Slimlines";

  text-align: center;
}
.Copasetic {
  font-family: "Copasetic";

  font-weight: bolder;
  text-transform: uppercase;
  text-align: center;
}

.Aerolite {
  font-family: "Aerolite";
  font-weight: bolder;
  text-align: center;
}

.Dancing {
  font-family: "Dancing";
  font-weight: bolder;
  text-align: center;
}

.input >>> label {
  position: relative;
  font-size: 2vh;

  color: green;
  text-align: center;
}
.input {
  position: relative;
  height: 2pc;
  font-size: 3vh;
  color: green;
  font-weight: Bolder;
}
.inputprice >>> label {
  position: relative;
  font-size: 2vh;

  color: lightcoral;
  text-align: center;
}
.inputprice {
  color: rgb(0, 255, 98);
  font-size: 3vh;
  /* text-decoration: line-through; */
}
.inputpricebutton {
  text-decoration: line-through;
}

.red1 {
  color: red;
}
.green1 {
  color: green;
}

.signheight {
  
  border-block-color: green;
}
</style>
