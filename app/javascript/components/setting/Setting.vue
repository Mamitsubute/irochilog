<template>
    <div class="setting">
        <v-container>
            <v-flex xs12 md4>
            <v-text-field
                v-model="email"
                :rules="emailRules"
                label="E-mail"
                required>
            </v-text-field>
            <v-text-field
                v-model="Name"
                label="Name"
                required>
            </v-text-field>
            <v-textarea
                name="input-7-1"
                label="Profile"
                hint="Hint text">
            </v-textarea>
            <v-btn
                :loading="loading3"
                :disabled="loading3"
                color="blue"
                class="white--text"
                @click="loader = 'loading3'">
                決定
            <v-icon right dark>done</v-icon>
            </v-btn>
            <v-btn
                :loading="loading3"
                :disabled="loading3"
                color="blue"
                class="white--text"
                @click="loader = 'loading3'">
                取消
            <v-icon right dark>clear</v-icon>
            </v-btn>

            </v-flex>
        </v-container>
    </div>
</template>
