import { Injectable } from "@nestjs/common";
import KcAdminClient from 'keycloak-admin';
import { Credentials } from 'keycloak-admin/lib/utils/auth';
import { RequiredActionAlias } from 'keycloak-admin/lib/defs/requiredActionProviderRepresentation';
import { User } from "src/users/user.entity";
import { RoleMappingPayload } from 'keycloak-admin/lib/defs/roleRepresentation';



const credentials: Credentials = {
    username: 'apiadmin@climatesi.com',
    password: 'QSCwdv!#*4',
    grantType: 'password',
    clientId: 'admin-api',
    // clientSecret: '88dad679-31e7-42e9-ba9a-9ed4a781b202'
    //clientSecret: 'b6c857c8-39ac-46ab-9b2d-2b761ff009bf' // ec2 server
    // clientSecret: '2b5f6e25-71a0-4826-af4d-dbeaffb67dbe' // icta server
    clientSecret: '9cfca685-664a-4dc3-b736-77a0f9190227' // live server

};

const serverConfig = {
    // baseUrl: 'http://127.0.0.1:8080/auth',
    // baseUrl: 'http://13.76.166.4:8080/auth',
    baseUrl: 'https://nccdsn.env.gov.lk/auth',
    //ec2-3-7-54-14.ap-south-1.compute.amazonaws.com
    realmName: 'ncc-dsn',
    //   requestConfig: {
    //     /* Axios request config options https://github.com/axios/axios#request-config */
    //   },
}

const kcAdminClient = new KcAdminClient(serverConfig);

// Authorize with username / password

@Injectable()
export class KeyClockService {

    async getUsers() {
        console.log("kk auth b4");

        // Override client configuration for all further requests:
        kcAdminClient.setConfig({
            realmName: 'ncc-dsn',
        });

        await kcAdminClient.auth(credentials);
        console.log("kk auth after");

        // List all users
        const users = await kcAdminClient.users.find();
        console.log("users================");
        console.log("users================", users);

        const user = await kcAdminClient.users.create({
            username: "testapiuser1@api.com",
            email: 'testapiuser1@api.com',
            // enabled required to be true in order to send actions email
            emailVerified: true,
            enabled: true,
        });
        console.log("user");
        console.log(user);
    }

    async createUser(user: User): Promise<boolean> {

        let newUser: any;

        kcAdminClient.setConfig({
            realmName: 'ncc-dsn',
        });

        console.log("kk auth before");
        await kcAdminClient.auth(credentials);
        console.log("kk auth after");

        try {
            newUser = await kcAdminClient.users.create({
                username: user.email,
                email: user.email,
                firstName: user.firstName,
                lastName: user.lastName,
                requiredActions: [RequiredActionAlias.VERIFY_EMAIL, RequiredActionAlias.UPDATE_PASSWORD],
                //emailVerified: true,
                // enabled required to be true in order to send actions email
                enabled: true,
                // realmRoles: ["ccs-admin"],
                // clientRoles: {
                //     "dsn-app": [
                //         "ccs-admin"
                //     ]
                // }

            });

            if (newUser.id) {
                // assign the key clock user role based on the user id
                await kcAdminClient.users.addRealmRoleMappings({
                    id: newUser.id,
                    roles: [{ id: user.userType.userRoleIdIdentity, name: user.userType.userRoleNameIdentity }]
                })

                // Send a update account email to the user An email contains a link the user can click to perform a set of required actions.
                await kcAdminClient.users.executeActionsEmail({
                    id: newUser.id,
                    actions: [RequiredActionAlias.VERIFY_EMAIL]
                })
            }



        } catch (error) {
            console.log("Error on kcAdminClient.users.create", error);

        }

        console.log("kk user");
        console.log(newUser);

        if (newUser && newUser.id) {
            return true;
        } else {
            return false;
        }
    }

    async deleteUser(email: string) {

        kcAdminClient.setConfig({
            realmName: 'ncc-dsn',
        });

        console.log("delete user start :  auth before");
        await kcAdminClient.auth(credentials);

        console.log("delete user start :  auth after");

        let userKC = await kcAdminClient.users.find({ email: email })

        if (userKC && userKC[0]) {
            await kcAdminClient.users.del({
                id: userKC[0].id
            });
        }

        console.log(" user deleted");

    }
}