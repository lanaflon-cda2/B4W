package com.bid4win.commons.persistence;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

/**
 * Classe de test du package com.bid4win.commons.persistence complet<BR>
 * <BR>
 * @author Emeric Fill�tre
 */
@RunWith(Suite.class)
@Suite.SuiteClasses({com.bid4win.commons.persistence.entity.AllTests.class,
                     com.bid4win.commons.persistence.usertype.AllTests.class,})
public class AllTests
{
  // Pas de d�finition sp�cifique
}