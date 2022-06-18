import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      component: resolve => require(['../pages/Login.vue'], resolve)
    },

    {
      path: '/Home',
      component: resolve => require(['../components/Home.vue'], resolve),
      children:[
        {
          path: '/Info',
          component: resolve => require(['../pages/InfoPage.vue'], resolve)
        },
        {
          path: '/Consumer',
          component: resolve => require(['../pages/ConsumerPage.vue'], resolve)
        },
        {
          path: '/loanlist',
          component: resolve => require(['../pages/LoanList.vue'], resolve)
        },
        {
          path: '/paneladd',
          component: resolve => require(['../pages/PanelAdd.vue'], resolve)
        },
        {
          path: '/paneledit/:id',
          component: resolve => require(['../pages/PanelEdit.vue'], resolve)
        },
        {
          path: '/panellist',
          component: resolve => require(['../pages/PanelList.vue'], resolve)
        },
        {
          path: '/loanadd',
          component: resolve => require(['../pages/LoanAdd.vue'], resolve)
        },
        {
          path: '/loanedit/:id',
          component: resolve => require(['../pages/LoanEdit.vue'], resolve)
        },
        {
          path: '/loanlist',
          component: resolve => require(['../pages/LoanList.vue'], resolve)
        },
        {
          path: '/donationlist',
          component: resolve => require(['../pages/DonationList.vue'], resolve)
        },
        {
          path: '/donationadd',
          component: resolve => require(['../pages/DonationAdd.vue'], resolve)
        },
        {
          path: '/productadd',
          component: resolve => require(['../pages/ProductAdd.vue'], resolve)
        },
        {
          path: '/donationedit/:id',
          component: resolve => require(['../pages/DonationEdit.vue'], resolve)
        },
        {
          path: '/productedit/:id',
          component: resolve => require(['../pages/ProductEdit.vue'], resolve)
        },
        {
          path: '/productlist',
          component: resolve => require(['../pages/ProductList.vue'], resolve)
        },
        {
          path: '/productorderlist',
          component: resolve => require(['../pages/ProductOrderList.vue'], resolve)
        },
        {
          path: '/donationorderlist',
          component: resolve => require(['../pages/DonationOrderList.vue'], resolve)
        },
        {
          path: '/povertyapplylist',
          component: resolve => require(['../pages/PovertyApplyList.vue'], resolve)
        },
        {
          path: '/tokenapplylist',
          component: resolve => require(['../pages/TokenApplyList.vue'], resolve)
        },
      ]
    }



  ]
})
